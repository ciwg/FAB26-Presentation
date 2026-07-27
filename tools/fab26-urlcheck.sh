#!/usr/bin/env bash
set -u

script_dir=$(dirname -- "$0")
if ! script_dir=$(cd -- "$script_dir" && pwd); then
  printf 'FAIL unable to resolve script directory\n' >&2
  exit 2
fi

if [ "$#" -gt 0 ]; then
  repo=$1
else
  if ! repo=$(cd -- "$script_dir/.." && pwd); then
    printf 'FAIL unable to resolve repository directory\n' >&2
    exit 2
  fi
fi

whitepaper="$repo/whitepaper_draft.md"
outdir=${OUTDIR:-/tmp/fab26-urlcheck}
if ! mkdir -p "$outdir"; then
  printf 'FAIL unable to create output directory: %s\n' "$outdir" >&2
  exit 2
fi
review="$outdir/reference-review.md"

failures=0

html_fragment() {
  kind="$1"
  src="$2"

  if ! command -v perl >/dev/null 2>&1; then
    return 0
  fi

  perl -0777 -e '
    my ($kind, $path) = @ARGV;
    open my $fh, "<", $path or exit 1;
    local $/;
    my $html = <$fh>;
    my $text = "";
    if ($kind eq "title" && $html =~ m{<title[^>]*>(.*?)</title>}is) {
      $text = $1;
    } elsif ($kind eq "heading" && $html =~ m{<h1[^>]*>(.*?)</h1>}is) {
      $text = $1;
    }
    $text =~ s/<[^>]+>/ /g;
    $text =~ s/&nbsp;/ /gi;
    $text =~ s/&amp;/&/gi;
    $text =~ s/&lt;/</gi;
    $text =~ s/&gt;/>/gi;
    $text =~ s/&quot;/"/gi;
    $text =~ s/\s+/ /g;
    $text =~ s/^\s+//;
    $text =~ s/\s+$//;
    print $text if $text ne "";
  ' "$kind" "$src"
}

write_text_extract() {
  src="$1"
  dest="$2"

  if ! command -v perl >/dev/null 2>&1; then
    printf 'skipped: perl not found'
    return 0
  fi

  if perl -0777 -e '
    my ($path) = @ARGV;
    open my $fh, "<", $path or exit 1;
    local $/;
    my $html = <$fh>;
    $html =~ s{<script\b[^>]*>.*?</script>}{}gis;
    $html =~ s{<style\b[^>]*>.*?</style>}{}gis;
    $html =~ s/<[^>]+>/ /g;
    $html =~ s/&nbsp;/ /gi;
    $html =~ s/&amp;/&/gi;
    $html =~ s/&lt;/</gi;
    $html =~ s/&gt;/>/gi;
    $html =~ s/&quot;/"/gi;
    $html =~ s/\s+/ /g;
    $html =~ s/^\s+//;
    $html =~ s/\s+$//;
    print "$html\n" if $html ne "";
  ' "$src" > "$dest"; then
    printf 'written'
  else
    status="$?"
    printf 'failed: perl exit %s' "$status"
  fi

  return 0
}

append_review() {
  id="$1"
  key="$2"
  label="$3"
  url="$4"
  marker="$5"
  claim="$6"
  status="$7"
  body="$8"
  headers="$9"
  text="${10}"
  text_status="${11}"
  title="${12}"
  heading="${13}"

  if ! {
    printf '## %s `%s`\n\n' "$id" "$key"
    printf -- '- Label: %s\n' "$label"
    printf -- '- URL: %s\n' "$url"
    printf -- '- Expected support: %s\n' "$claim"
    printf -- '- Marker: `%s`\n' "$marker"
    printf -- '- Result: %s\n' "$status"
    printf -- '- Headers: `%s`\n' "$headers"
    printf -- '- Full HTML/body: `%s`\n' "$body"
    printf -- '- Extracted text: `%s` (%s)\n' "$text" "$text_status"
    if [ -n "$title" ]; then
      printf -- '- Page title: %s\n' "$title"
    fi
    if [ -n "$heading" ]; then
      printf -- '- First H1: %s\n' "$heading"
    fi
    printf '\n'
  } >> "$review"; then
    printf 'FAIL %s review-append :: %s\n' "$id" "$url"
    failures=$((failures + 1))
  fi
}

check_url() {
  id="$1"
  key="$2"
  label="$3"
  url="$4"
  marker="$5"
  claim="$6"
  body="$outdir/$id.body"
  headers="$outdir/$id.headers"
  text="$outdir/$id.text"
  result='fetch-failed'
  text_status='skipped: fetch failed'
  title=''
  heading=''

  # Intent: Keep the fetch/marker check deterministic while emitting enough
  # evidence for a human or LLM to review citation quality. Source: DI-vujop
  if ! : > "$body"; then
    printf 'FAIL %s body-init :: %s\n' "$id" "$body"
    result='body-init-failed'
    text_status='skipped: body init failed'
    failures=$((failures + 1))
    append_review "$id" "$key" "$label" "$url" "$marker" "$claim" \
      "$result" "$body" "$headers" "$text" "$text_status" "$title" "$heading"
    return
  fi
  if ! : > "$headers"; then
    printf 'FAIL %s headers-init :: %s\n' "$id" "$headers"
    result='headers-init-failed'
    text_status='skipped: headers init failed'
    failures=$((failures + 1))
    append_review "$id" "$key" "$label" "$url" "$marker" "$claim" \
      "$result" "$body" "$headers" "$text" "$text_status" "$title" "$heading"
    return
  fi
  if ! : > "$text"; then
    printf 'FAIL %s text-init :: %s\n' "$id" "$text"
    result='text-init-failed'
    text_status='skipped: text init failed'
    failures=$((failures + 1))
    append_review "$id" "$key" "$label" "$url" "$marker" "$claim" \
      "$result" "$body" "$headers" "$text" "$text_status" "$title" "$heading"
    return
  fi

  if curl \
    --location \
    --fail \
    --silent \
    --show-error \
    --max-time 30 \
    --connect-timeout 10 \
    --user-agent 'curl/fab26-url-check' \
    --dump-header "$headers" \
    --output "$body" \
    "$url"; then
    if grep -qi -- "$marker" "$body"; then
      result='pass'
      printf 'PASS %s fetch+marker %s :: %s\n' "$id" "$marker" "$url"
    else
      result='marker-missing'
      printf 'FAIL %s marker-missing %s :: %s\n' "$id" "$marker" "$url"
      failures=$((failures + 1))
    fi
    text_status=$(write_text_extract "$body" "$text")
    title=$(html_fragment title "$body")
    heading=$(html_fragment heading "$body")
  else
    printf 'FAIL %s fetch :: %s\n' "$id" "$url"
    failures=$((failures + 1))
  fi

  append_review "$id" "$key" "$label" "$url" "$marker" "$claim" \
    "$result" "$body" "$headers" "$text" "$text_status" "$title" "$heading"
}

if [ ! -r "$whitepaper" ]; then
  printf 'FAIL missing whitepaper: %s\n' "$whitepaper" >&2
  exit 2
fi

printf 'Checking URLs from %s\n' "$whitepaper"
printf 'Writing fetched bodies and headers under %s\n' "$outdir"
if ! {
  printf '# FAB26 Reference Review\n\n'
  printf 'Generated by `tools/fab26-urlcheck.sh`.\n\n'
  printf 'Fetched files live under `%s`.\n\n' "$outdir"
  printf 'Use this file as an LLM or human review index. For each reference,\n'
  printf 'compare the expected support statement with the cited page. Read the\n'
  printf 'full body file when the extracted text or page metadata is not enough.\n\n'
} > "$review"; then
  printf 'FAIL unable to initialize review file: %s\n' "$review" >&2
  exit 2
fi

check_url 01 promise-theory 'Wikipedia overview of Promise Theory' 'https://en.wikipedia.org/wiki/Promise_theory' 'Promise theory' 'Supports the background reference for Promise Theory.'
check_url 02 cswg 'Community Systems Working Group' 'https://cswg.infrastructures.org/' 'Community Systems Working Group' 'Identifies the Community Systems Working Group.'
check_url 03 promisegrid 'PromiseGrid' 'https://github.com/promisegrid/promisegrid' 'promisegrid' 'Identifies the PromiseGrid project repository.'
check_url 04 grid-cbor-tag-spec 'PromiseGrid grid CBOR tag specification' 'https://github.com/promisegrid/promisegrid/blob/main/docs/grid-cbor-tag-spec.md' 'grid-cbor-tag-spec' 'Defines the PromiseGrid grid CBOR tag and grid(...) envelope reference.'
check_url 05 wire-lab 'PromiseGrid wire-lab' 'https://github.com/promisegrid/wire-lab' 'wire-lab' 'Identifies the wire-lab prototype repository.'
check_url 06 grid-examples 'PromiseGrid examples' 'https://github.com/ciwg/grid-examples' 'grid-examples' 'Identifies the grid examples repository.'
check_url 07 erp 'Wikipedia, Enterprise resource planning' 'https://en.wikipedia.org/wiki/Enterprise_resource_planning' 'Enterprise resource planning' 'Defines ERP for existing supply-chain software context.'
check_url 08 edi 'Wikipedia, Electronic data interchange' 'https://en.wikipedia.org/wiki/Electronic_data_interchange' 'Electronic data interchange' 'Defines EDI for existing supply-chain software context.'
check_url 09 mes 'Wikipedia, Manufacturing execution system' 'https://en.wikipedia.org/wiki/Manufacturing_execution_system' 'Manufacturing execution system' 'Defines MES for existing manufacturing software context.'
check_url 10 qms 'Wikipedia, Quality management system' 'https://en.wikipedia.org/wiki/Quality_management_system' 'Quality management system' 'Defines QMS for existing quality-management software context.'
check_url 11 iso-9000 'Wikipedia, ISO 9000 family' 'https://en.wikipedia.org/wiki/ISO_9000_family' 'ISO 9000' 'Defines the ISO 9000 standards family.'
check_url 12 promise-theory-faq 'Mark Burgess Promise Theory FAQ' 'https://markburgess.org/promiseFAQ.html' 'Promise' 'Provides Mark Burgess background material on Promise Theory.'
check_url 13 cid 'IPFS CID specification' 'https://specs.ipfs.tech/cid/' 'Content Identifier' 'Defines CID as an externally specified content identifier.'
check_url 14 car 'IPLD CAR specification' 'https://ipld.io/specs/transport/car/' 'Content Addressable aRchives' 'Defines CAR as the IPLD Content Addressable aRchive format.'
check_url 15 cas 'Wikipedia, Content-addressable storage' 'https://en.wikipedia.org/wiki/Content-addressable_storage' 'Content-addressable storage' 'Defines content-addressable storage for the glossary.'
check_url 16 cbor 'IETF RFC 8949, Concise Binary Object Representation' 'https://www.rfc-editor.org/info/rfc8949' 'RFC 8949' 'Defines CBOR as an IETF standard.'
check_url 17 cose 'IETF RFC 9052, CBOR Object Signing and Encryption' 'https://www.rfc-editor.org/rfc/rfc9052.html' 'CBOR Object Signing' 'Defines COSE as an IETF standard.'
check_url 18 cwt 'IETF RFC 8392, CBOR Web Token' 'https://www.rfc-editor.org/info/rfc8392' 'RFC 8392' 'Defines CWT as an IETF standard.'
check_url 19 iana 'IANA About' 'https://www.iana.org/about' 'Internet Assigned Numbers Authority' 'Identifies IANA as the registry authority referenced by the glossary.'
check_url 20 wasm 'WebAssembly specifications' 'https://webassembly.org/specs/' 'WebAssembly' 'Identifies WebAssembly specifications for the glossary.'
check_url 21 wasi 'WASI.dev' 'https://wasi.dev/' 'WASI' 'Identifies WASI for the glossary.'
check_url 22 atp-ctp 'ETH Zurich, Available-to-Promise and Capable-to-Promise' 'https://opess.ethz.ch/course/section-5-3/5-3-5-available-to-promise-atp-and-capable-to-promise-ctp/' 'Available-to-Promise' 'Defines ATP and CTP for the supply-chain promise discussion.'
check_url 23 vcs 'Git Book, About Version Control' 'https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control' 'About Version Control' 'Defines version control for the glossary.'
check_url 24 microkernel 'Wikipedia, Microkernel' 'https://en.wikipedia.org/wiki/Microkernel' 'Microkernel' 'Defines microkernel for the operating-system analogy.'
check_url 25 iop 'Internet of Production' 'https://www.internetofproduction.org/' 'decentralized manufacturing' 'Identifies the Internet of Production and its decentralized manufacturing focus.'
check_url 26 open-know-how 'Open Know-How' 'https://www.internetofproduction.org/openknowhow' 'Open Know-How' 'Identifies Open Know-How as an IoP standard.'
check_url 27 open-know-where 'Open Know-Where' 'https://www.internetofproduction.org/openknowwhere' 'Open Know-Where' 'Identifies Open Know-Where as an IoP standard.'
check_url 28 nom-cswg 'Nation of Makers, Community Systems Working Group' 'https://www.nationofmakers.us/community-systems-working-group' 'Community Systems Working Group' 'Supports the CSWG lineage reference.'
check_url 29 nom-history 'Nation of Makers history' 'https://www.nationofmakers.us/history' 'Nation of Makers Initiative' 'Supports the Nation of Makers lineage reference.'
check_url 30 whitehouse-making-2016 'White House, Kicking Off the 2016 National Week of Making' 'https://obamawhitehouse.archives.gov/blog/2016/06/16/kicking-2016-national-week-making' 'Office of Science and Technology Policy' 'Supports the White House/OSTP maker-organizing lineage reference.'
check_url 31 systems-management-list 'Wikipedia, List of systems management systems' 'https://en.wikipedia.org/wiki/List_of_systems_management_systems' 'List of systems management systems' 'Supports the systems-management heritage reference.'
check_url 32 isconf 'Wikipedia, ISconf' 'https://en.wikipedia.org/wiki/ISconf' 'ISconf' 'Supports the ISconf heritage reference.'
check_url 33 cfengine 'Wikipedia, CFEngine' 'https://en.wikipedia.org/wiki/CFEngine' 'CFEngine' 'Supports the CFEngine heritage reference.'
check_url 34 nasa-ipg 'NASA NTRS, Information Power Grid' 'https://ntrs.nasa.gov/citations/20000064597' 'Information Power Grid' 'Supports the NASA Information Power Grid heritage reference.'
check_url 35 bootstrapping-infrastructure 'USENIX, Bootstrapping an Infrastructure' 'https://www.usenix.org/conference/lisa-98/bootstrapping-infrastructure' 'Bootstrapping an Infrastructure' 'Supports the infrastructure bootstrapping heritage reference.'
check_url 36 why-order-matters 'USENIX, Why Order Matters' 'https://www.usenix.org/conference/lisa-02/why-order-matters-turing-equivalence-automated-systems-administration' 'Why Order Matters' 'Supports the order-of-operations heritage reference.'
check_url 37 devops 'Wikipedia, DevOps' 'https://en.wikipedia.org/wiki/DevOps' 'DevOps' 'Supports the DevOps heritage reference.'

if [ "$failures" -eq 0 ]; then
  printf 'Review bundle: %s\n' "$review"
  printf 'PASS all URL checks\n'
  exit 0
fi

printf 'FAIL %s URL checks failed\n' "$failures"
printf 'Review bundle: %s\n' "$review"
exit 1
