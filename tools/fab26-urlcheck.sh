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

failures=0

check_url() {
  id="$1"
  url="$2"
  marker="$3"
  body="$outdir/$id.body"
  headers="$outdir/$id.headers"

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
      printf 'PASS %s fetch+marker %s :: %s\n' "$id" "$marker" "$url"
    else
      printf 'FAIL %s marker-missing %s :: %s\n' "$id" "$marker" "$url"
      failures=$((failures + 1))
    fi
  else
    printf 'FAIL %s fetch :: %s\n' "$id" "$url"
    failures=$((failures + 1))
  fi
}

if [ ! -r "$whitepaper" ]; then
  printf 'FAIL missing whitepaper: %s\n' "$whitepaper" >&2
  exit 2
fi

printf 'Checking URLs from %s\n' "$whitepaper"
printf 'Writing fetched bodies and headers under %s\n' "$outdir"

check_url 01 'https://en.wikipedia.org/wiki/Promise_theory' 'Promise theory'
check_url 02 'https://cswg.infrastructures.org/' 'Community Systems Working Group'
check_url 03 'https://github.com/promisegrid/promisegrid' 'promisegrid'
check_url 04 'https://github.com/promisegrid/promisegrid/blob/main/docs/grid-cbor-tag-spec.md' 'grid-cbor-tag-spec'
check_url 05 'https://github.com/promisegrid/wire-lab' 'wire-lab'
check_url 06 'https://github.com/ciwg/grid-examples' 'grid-examples'
check_url 07 'https://en.wikipedia.org/wiki/Enterprise_resource_planning' 'Enterprise resource planning'
check_url 08 'https://en.wikipedia.org/wiki/Electronic_data_interchange' 'Electronic data interchange'
check_url 09 'https://csrc.nist.gov/glossary/term/manufacturing_execution_system' 'Manufacturing Execution System'
check_url 10 'https://en.wikipedia.org/wiki/Quality_management_system' 'Quality management system'
check_url 11 'https://en.wikipedia.org/wiki/ISO_9000_family' 'ISO 9000'
check_url 12 'https://markburgess.org/promiseFAQ.html' 'Promise'
check_url 13 'https://specs.ipfs.tech/cid/' 'Content Identifier'
check_url 14 'https://ipld.io/specs/transport/car/' 'Content Addressable aRchives'
check_url 15 'https://csrc.nist.gov/glossary/term/content_addressable_storage' 'Content Addressable Storage'
check_url 16 'https://www.rfc-editor.org/info/rfc8949' 'RFC 8949'
check_url 17 'https://www.rfc-editor.org/rfc/rfc9052.html' 'CBOR Object Signing'
check_url 18 'https://www.rfc-editor.org/info/rfc8392' 'RFC 8392'
check_url 19 'https://www.iana.org/about' 'Internet Assigned Numbers Authority'
check_url 20 'https://webassembly.org/specs/' 'WebAssembly'
check_url 21 'https://wasi.dev/' 'WASI'
check_url 22 'https://opess.ethz.ch/course/section-5-3/5-3-5-available-to-promise-atp-and-capable-to-promise-ctp/' 'Available-to-Promise'
check_url 23 'https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control' 'About Version Control'
check_url 24 'https://en.wikipedia.org/wiki/Microkernel' 'Microkernel'
check_url 25 'https://www.internetofproduction.org/' 'decentralized manufacturing'
check_url 26 'https://www.internetofproduction.org/openknowhow' 'Open Know-How'
check_url 27 'https://www.internetofproduction.org/openknowwhere' 'Open Know-Where'
check_url 28 'https://www.nationofmakers.us/community-systems-working-group' 'Community Systems Working Group'
check_url 29 'https://www.nationofmakers.us/history' 'Nation of Makers Initiative'
check_url 30 'https://obamawhitehouse.archives.gov/blog/2016/06/16/kicking-2016-national-week-making' 'Office of Science and Technology Policy'

if [ "$failures" -eq 0 ]; then
  printf 'PASS all URL checks\n'
  exit 0
fi

printf 'FAIL %s URL checks failed\n' "$failures"
exit 1
