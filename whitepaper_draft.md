# Community-Owned Infrastructure for Decentralized Manufacturing

```
######  ######     #    ####### #######
#     # #     #   # #   #          #
#     # #     #  #   #  #          #
#     # ######  #     # #####      #
#     # #   #   ####### #          #
#     # #    #  #     # #          #
######  #     # #     # #          #
```


## The Infrastructure Gap in Decentralized Manufacturing

PromiseGrid[^promisegrid] is infrastructure for decentralized
manufacturing: shared software, shared infrastructure, and shared
decisions under local and shared control.

In this paper, we use "distributed" and "decentralized" to refer to
distinct concepts. Distributed production means work spread across
many sites while a central company, platform, or controller
coordinates the system. Decentralized production means mesh-like
coordination: participants run local infrastructure, coordinate
directly, and manage shared commitments locally.

## Distributed Manufacturing Already Exists at Industrial Scale

Distributed manufacturing already exists at industrial scale. The
global economy runs through long supply chains, specialized vendors,
outsourced fabrication, contract manufacturing, logistics providers,
and digital coordination across many sites.

That model spreads work while authority stays central. A product can
pass through five companies before it ships, while a buyer, platform,
lead firm, or certification process still controls the data,
approvals, and disputes.

ERP[^erp], EDI[^edi], MES[^mes], QMS[^qms], ISO 9000[^iso-9000],
vendor portals, and formal supply-chain standards already exist, but
they assume institutional budgets, dedicated staff, centralized
administration, and heavyweight, mature processes.

By contrast, decentralized manufacturing coordination systems must
support:

- lightweight, flexible processes
- local operation by each participant
- decentralized coordination across sites
- partial trust between independent actors
- offline or transport-independent data transfer
- low administrative overhead

The best efforts of most individuals and small shops today rely on:

- cloud-hosted spreadsheets, docs, calendars
- chat threads hosted on centralized platforms
- consumer-oriented file sharing hosts
- small-business accounting software that integrates poorly with
  everything else
- and lots and lots of email and phone calls to fill in the gaps and
  glue it all together

> Visual placeholder: A diagram showing today's distributed
> supply-chain coordination alongside community-owned decentralized
> production infrastructure. Show where production happens and who
> governs the coordination layer.

## Community Systems Working Group (CSWG)

CSWG[^cswg] builds open-source infrastructure for groups, communities,
and organizations that need shared software, shared infrastructure, and
shared decisions under shared control.

CSWG is developing PromiseGrid as part of that infrastructure work.

CSWG started as a Nation of Makers working group.[^nom-cswg] Nation of
Makers traces its roots to the White House Office of Science and
Technology (OSTP) Nation of Makers initiative, launched in June 2014,
and to the organizing that followed through the 2016 National Week of
Making and White House/OSTP
meetings.[^nom-history][^whitehouse-making-2016]

## Related Work: Internet of Production

The Internet of Production (IoP) Alliance advances decentralized
manufacturing based on shared knowledge.[^iop] Its standards include
Open Know-How, an open data model for sharing hardware designs and
documentation, and Open Know-Where, a mapping standard for manufacturing
facilities and capabilities.[^open-know-how][^open-know-where]

PromiseGrid operates at a different stack layer. IoP standards make
designs, facilities, machines, and capabilities discoverable.
PromiseGrid carries signed messages, local capabilities, promises,
application code, content-addressed data, and peer sync between nodes
that remain under local control.

A rough analogy is that PromiseGrid is intended to act as a
"decentralized operating system" for applications to run on top of.
The grid abstracts away the details of network, transport, storage,
and trust in a way that provides a relatively standard and stable
"single virtual machine" substrate for multiple applications to build
and deploy on.  If an IoP-compliant application, for example, were
written for or ported to the grid, the details of how the application
is deployed, how it communicates, where data is stored, and how trust is
established would be handled by the grid infrastructure rather than
needing to be re-created for each individual application.

## PromiseGrid Architecture

PromiseGrid is CSWG's experimental decentralized computing and
coordination infrastructure for apps that groups and communities can
use to share software, data, and decisions under local control.

PromiseGrid sits below applications. It defines lower-level building
blocks for community-owned computation: explicit promises, narrow
capabilities, consensus, and shared governance.

> Visual placeholder: A concept image or lightweight architecture
> diagram showing PromiseGrid as a shared computing substrate between
> individuals, organizations, devices, and applications.

## Promise Theory

PromiseGrid's design is based in part on Promise Theory[^promise-theory],
by Mark Burgess[^promise-theory-faq] and collaborators. Promise Theory
is based on principles of voluntary cooperation and local authority,
such as:

- An agent can only make promises about its own behavior
- An agent cannot promise what another agent will do
- Trust is built over time from ability to keep promises
- Trust is local, not global. Each agent makes its own trust decisions
- Coordination is built on trust, not from authority or control

## What a PromiseGrid Message Looks Like

PromiseGrid messages are structured envelopes[^grid-cbor-tag-spec]. The
outer shape is:

```text
grid([42(pCID), ...protocol-defined-slots])
```

`grid(...)` is the CBOR[^cbor] PromiseGrid
envelope. The IANA[^iana]-registered PromiseGrid grid CBOR tag
specification defines
this envelope and the tag-42 pCID[^grid-cbor-tag-spec] slot. Slot 0
carries `42(pCID)`, a CID[^cid] link to the protocol spec. The
protocol spec defines the rest of the message: slot count, slot
meanings, payload shape, signable bytes, and proof placement. CIDs are
binary on the wire and CIDv1 base32 when printed.

A protocol spec document might define a compact message shaped like
this:

```text
grid([42(pCID), payload])
```

Another protocol might define:

```text
grid([42(pCID), parents, payload, signature])
```

Other protocols might carry COSE[^cose] objects, CAR[^car] bytes,
encrypted bytes, or nested pCID-owned structures. The selected protocol
spec gives those slots their meaning.

Grid messages are transport-agnostic. The same `grid(...)` message
might travel over TCP, HTTP, WebSocket, version-control history,
file transfer, or a thumb drive.

An IoT device protocol might look like this example, taken from a
current prototype application:[^grid-examples]

```text
grid([42(pCID), payload])
payload = ["MSG", "gateway-bob", "m4-ivan", "BT-1042", "created"]
```

Here, Bob (a Raspberry Pi) promises Ivan (a Cortex-M4 microcontroller)
that order BT-1042 has been created.  In the prototype app this
message comes from, Ivan is a small device that travels with the order
as it flows through production, tracking build status.

## Prototype Architecture

The current prototype architecture[^wire-lab] is roughly based on a
two-stage bootstrap model with a microkernel-like
architecture:[^microkernel]

- Stage0 is a small installed `grid` bootstrap that can fetch, verify,
  approve, and start a fetched local runtime layer
- Stage1 provides daemon roles, transport, CAS[^cas]/VCS[^vcs],
  parser/builders, capability checks, and app execution support
- Stage1 binaries are fetched and verified by stage0, cached in the CAS<
  then run under local control
  - Stage1 binaries might be native executables, WASI[^wasi]/WASM[^wasm],
    or other portable runtimes

PromiseGrid uses capability-based security.
Capability tokens match decentralized trust:

- Carol can give Alice a capability token that allows her to read a
  file, but not write it
- Ellen can give Bob a capability token that allows him to use machine
  A, but not machine B

Current prototypes use CWT[^cwt] and COSE for signed capability tokens.

PromiseGrid messages can cross organization, machine, and workflow
boundaries.

## Decentralized Manufacturing Requirements

For decentralized manufacturing to work, Alice's lab must coordinate
with Bob's school, Carol's repair collective, and Dave's small shop
while each keeps local authority. Shared stewardship must work across
different owners. Software must run across laptops, phones, servers,
browser tabs, and small devices. Governance must support multiple
local authorities.

A few messy cases:

- temporary machine access for visiting collaborators
- site A printing a part for site B to assemble
- accounting for usage and maintenance of shared machines
- collaborative CAD/CAM tools that don't depend on a single cloud provider

> Visual placeholder: A map or network sketch showing members of
> several fablabs or makerspaces sharing selected resources and
> commitments through local nodes and shared protocols.

## PromiseGrid Is Infrastructure

PromiseGrid is infrastructure beneath booking screens, inventory
forms, and slicers. It carries tools, capability promises, local
resource promises, and cooperative workflows across a decentralized
network. Decentralized production joins design files, inventory
signals, training status, machine reservations, fabrication tasks,
quality checks, shipping, documentation, and repair across
organizational boundaries. The substrate must carry data and
negotiated trust.

CAS is the durable substrate. Exact grid messages, app code, data
objects, CAR bundles, and protocol specs are content-addressed. Each
agent keeps a partial CAS view. Message CIDs and parent links form DAG
histories. Reference sets serve as roots, tags, branches, and review
points.

## ATP, CTP, and Promise-Shaped Coordination

Supply chains already use some promise terms:

- ATP[^atp-ctp]: inventory or supply available for demand
- CTP[^atp-ctp]: capacity and capability available under the required
  conditions

Promise Theory gives ATP and CTP a network form: structured
commitments visible across organizations.

PromiseGrid gives those promises an open network protocol; rather than
being locked into a single vendor's software, the commitments can be
shared across organizations and applications.

## Glossary

- ATP: Available to Promise; supply available for demand; see [^atp-ctp]
- CAR: Content Addressable aRchive; a portable bundle of CAS objects;
  see [^car]
- CAS: content-addressed storage; storage keyed by content identifiers;
  see [^cas]
- CBOR: Concise Binary Object Representation; a compact binary data
  format; see [^cbor]
- CID: Content Identifier; a content-addressed identifier for bytes or
  structured content; see [^cid]
- COSE: CBOR Object Signing and Encryption; standards for signing and
  encrypting CBOR data; see [^cose]
- CTP: Capable to Promise; capacity and capability available under
  required conditions; see [^atp-ctp]
- CWT: CBOR Web Token; a compact token format carried in CBOR; see [^cwt]
- `grid(...)`: diagnostic notation for the PromiseGrid CBOR envelope;
  see [^grid-cbor-tag-spec]
- IANA: Internet Assigned Numbers Authority; manages global protocol
  registries and related technical identifiers; see [^iana]
- microkernel: a small kernel that keeps only essential mechanisms in
  kernel space; see [^microkernel]
- pCID: Protocol CID; a CID for the protocol specification that
  defines the remaining message slots; see [^grid-cbor-tag-spec]
- Stage0: the small installed `grid` bootstrap
- Stage1: fetched runtime layer that provides daemon roles, transport,
  CAS/VCS, parser/builders, capability checks, and app execution
- VCS: version-control system; see [^vcs]
- WASI: WebAssembly System Interface; see [^wasi]
- WASM: WebAssembly; see [^wasm]

## References

[^cswg]: Community Systems Working Group: [https://cswg.infrastructures.org/](https://cswg.infrastructures.org/)
[^promisegrid]: PromiseGrid: [https://github.com/promisegrid/promisegrid](https://github.com/promisegrid/promisegrid)
[^grid-cbor-tag-spec]: PromiseGrid grid CBOR tag specification: [https://github.com/promisegrid/promisegrid/blob/main/docs/grid-cbor-tag-spec.md](https://github.com/promisegrid/promisegrid/blob/main/docs/grid-cbor-tag-spec.md)
[^wire-lab]: PromiseGrid wire-lab: [https://github.com/promisegrid/wire-lab](https://github.com/promisegrid/wire-lab)
[^grid-examples]: PromiseGrid examples: [https://github.com/ciwg/grid-examples](https://github.com/ciwg/grid-examples)
[^iop]: Internet of Production: [https://www.internetofproduction.org/](https://www.internetofproduction.org/)
[^open-know-how]: Open Know-How: [https://www.internetofproduction.org/openknowhow](https://www.internetofproduction.org/openknowhow)
[^open-know-where]: Open Know-Where: [https://www.internetofproduction.org/openknowwhere](https://www.internetofproduction.org/openknowwhere)
[^nom-cswg]: Nation of Makers, Community Systems Working Group: [https://www.nationofmakers.us/community-systems-working-group](https://www.nationofmakers.us/community-systems-working-group)
[^nom-history]: Nation of Makers history: [https://www.nationofmakers.us/history](https://www.nationofmakers.us/history)
[^whitehouse-making-2016]: White House, Kicking Off the 2016 National Week of Making: [https://obamawhitehouse.archives.gov/blog/2016/06/16/kicking-2016-national-week-making](https://obamawhitehouse.archives.gov/blog/2016/06/16/kicking-2016-national-week-making)
[^erp]: Wikipedia, Enterprise resource planning: [https://en.wikipedia.org/wiki/Enterprise_resource_planning](https://en.wikipedia.org/wiki/Enterprise_resource_planning)
[^edi]: Wikipedia, Electronic data interchange: [https://en.wikipedia.org/wiki/Electronic_data_interchange](https://en.wikipedia.org/wiki/Electronic_data_interchange)
[^mes]: NIST CSRC glossary, Manufacturing Execution System: [https://csrc.nist.gov/glossary/term/manufacturing_execution_system](https://csrc.nist.gov/glossary/term/manufacturing_execution_system)
[^qms]: Wikipedia, Quality management system: [https://en.wikipedia.org/wiki/Quality_management_system](https://en.wikipedia.org/wiki/Quality_management_system)
[^iso-9000]: Wikipedia, ISO 9000 family: [https://en.wikipedia.org/wiki/ISO_9000_family](https://en.wikipedia.org/wiki/ISO_9000_family)
[^promise-theory]: Wikipedia overview of Promise Theory: [https://en.wikipedia.org/wiki/Promise_theory](https://en.wikipedia.org/wiki/Promise_theory)
[^promise-theory-faq]: Mark Burgess Promise Theory FAQ: [https://markburgess.org/promiseFAQ.html](https://markburgess.org/promiseFAQ.html)
[^cid]: IPFS CID specification: [https://specs.ipfs.tech/cid/](https://specs.ipfs.tech/cid/)
[^car]: IPLD CAR specification: [https://ipld.io/specs/transport/car/](https://ipld.io/specs/transport/car/)
[^cas]: NIST glossary, Content Addressable Storage: [https://csrc.nist.gov/glossary/term/content_addressable_storage](https://csrc.nist.gov/glossary/term/content_addressable_storage)
[^cbor]: IETF RFC 8949, Concise Binary Object Representation: [https://www.rfc-editor.org/info/rfc8949](https://www.rfc-editor.org/info/rfc8949)
[^cose]: IETF RFC 9052, CBOR Object Signing and Encryption: [https://www.rfc-editor.org/rfc/rfc9052.html](https://www.rfc-editor.org/rfc/rfc9052.html)
[^cwt]: IETF RFC 8392, CBOR Web Token: [https://www.rfc-editor.org/info/rfc8392](https://www.rfc-editor.org/info/rfc8392)
[^iana]: IANA About: [https://www.iana.org/about](https://www.iana.org/about)
[^wasm]: WebAssembly specifications: [https://webassembly.org/specs/](https://webassembly.org/specs/)
[^wasi]: WASI.dev: [https://wasi.dev/](https://wasi.dev/)
[^atp-ctp]: ETH Zurich, Available-to-Promise and Capable-to-Promise: [https://opess.ethz.ch/course/section-5-3/5-3-5-available-to-promise-atp-and-capable-to-promise-ctp/](https://opess.ethz.ch/course/section-5-3/5-3-5-available-to-promise-atp-and-capable-to-promise-ctp/)
[^vcs]: Git Book, About Version Control: [https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control)
[^microkernel]: Wikipedia, Microkernel: [https://en.wikipedia.org/wiki/Microkernel](https://en.wikipedia.org/wiki/Microkernel)
