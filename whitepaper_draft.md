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

PromiseGrid is infrastructure for decentralized manufacturing: shared
software, shared infrastructure, and shared decisions under local and
shared control.

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

ERP, EDI, MES, QMS, ISO 9000, vendor portals, and formal supply-chain
standards already exist, but they assume institutional budgets,
dedicated staff, centralized administration, and heavyweight, mature
processes.

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

CSWG builds open-source infrastructure for groups, communities, and
organizations that need shared software, shared infrastructure, and
shared decisions under shared control.



## PromiseGrid Architecture

PromiseGrid is experimental decentralized computing and coordination
infrastructure for apps that groups and communities can use to share
software, data, and decisions under local control.

PromiseGrid sits below applications. It defines lower-level building
blocks for community-owned computation: explicit promises, narrow
capabilities, consensus, and shared governance.

> Visual placeholder: A concept image or lightweight architecture
> diagram showing PromiseGrid as a shared computing substrate between
> individuals, organizations, devices, and applications.

## Promise Theory

PromiseGrid's design is based in part on [Promise
Theory](https://en.wikipedia.org/wiki/Promise_theory), by Mark Burgess
and collaborators. Promise Theory is based on principles of
voluntary cooperation and local authority, such as:

- An agent can only make promises about its own behavior
- An agent cannot promise what another agent will do
- Trust is built over time from ability to keep promises
- Trust is local, not global. Each agent makes its own trust decisions
- Coordination is built on trust, not from authority or control

## What a PromiseGrid Message Looks Like

PromiseGrid messages are structured envelopes. The outer shape is:

```text
grid([42(pCID), ...protocol-defined-slots])
```

`grid(...)` is the CBOR PromiseGrid envelope. The IANA-registered
PromiseGrid grid CBOR tag specification defines this envelope and the
tag-42 pCID slot. Slot 0 carries `42(pCID)`, a CID link to the
protocol spec. The protocol spec defines the rest of the message: slot
count, slot meanings, payload shape, signable bytes, and proof
placement. CIDs are binary on the wire and CIDv1 base32 when printed.

A protocol spec document might define a compact message shaped like
this:

```text
grid([42(pCID), payload])
```

Another protocol might define:

```text
grid([42(pCID), parents, payload, signature])
```

Other protocols might carry COSE objects, CAR bytes, encrypted bytes, or
nested pCID-owned structures. The selected protocol spec gives those
slots their meaning.

Grid messages are transport-agnostic. The same `grid(...)` message
might travel over TCP, HTTP, WebSocket, version-control history,
file transfer, or a thumb drive.

An IoT device protocol might look like this example, taken from a
current prototype application:

```text
grid([42(pCID), payload])
payload = ["MSG", "gateway-bob", "m4-ivan", "BT-1042", "created"]
```

Here, Bob (a Raspberry Pi) promises Ivan (a Cortex-M4 microcontroller)
that order BT-1042 has been created.  In the prototype app this
message comes from, Ivan is a small device that travels with the order
as it flows through production, tracking build status.

## Prototype Architecture

The current prototype architecture is roughly based on a two-stage bootstrap model with a microkernel-like architecture:

- Stage0 is a small installed `grid` bootstrap that can fetch, verify,
  approve, and start a fetched local runtime layer
- Stage1 provides daemon roles, transport, CAS/VCS, parser/builders,
  capability checks, and app execution support
- Stage1 binaries are fetched and verified by stage0, cached in the CAS< then run under local control
  - Stage1 binaries might be native executables, WASI/WASM, or other portable runtimes

PromiseGrid uses capability-based security.
Capability tokens match decentralized trust:

- Carol can give Alice a capability token that allows her to read a
  file, but not write it
- Ellen can give Bob a capability token that allows him to use machine
  A, but not machine B

Current prototypes use CWT and COSE for signed capability tokens.

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

- ATP: inventory or supply available for demand
- CTP: capacity and capability available under the required conditions

Promise Theory gives ATP and CTP a network form: structured
commitments visible across organizations.

PromiseGrid gives those promises an open network protocol; rather than
being locked into a single vendor's software, the commitments can be
shared across organizations and applications.

## Glossary

- ATP: Available to Promise; supply available for demand
- CAR: Content Addressable aRchive; a portable bundle of CAS objects
- CAS: content-addressed storage; storage keyed by content identifiers
- CBOR: Concise Binary Object Representation; a compact binary data
  format
- CID: Content Identifier; a content-addressed identifier for bytes or
  structured content
- COSE: CBOR Object Signing and Encryption; standards for signing and
  encrypting CBOR data
- CTP: Capable to Promise; capacity and capability available under
  required conditions
- CWT: CBOR Web Token; a compact token format carried in CBOR
- `grid(...)`: diagnostic notation for the PromiseGrid CBOR envelope
- IANA: Internet Assigned Numbers Authority; the organization that manages global protocol registries, IP addresses, port numbers, etc.
- microkernel: a small, minimal kernel that provides only essential services, with other services running in user space
- pCID: Protocol CID; a CID for the protocol specification that
  defines the remaining message slots
- Stage0: the small installed `grid` bootstrap
- Stage1: fetched runtime layer that provides daemon roles, transport,
  CAS/VCS, parser/builders, capability checks, and app execution
- VCS: version-control system
- WASI: WebAssembly System Interface
- WASM: WebAssembly

## References

1. Community Systems Working Group: <https://cswg.infrastructures.org/>
2. PromiseGrid: <https://github.com/promisegrid/promisegrid>
3. PromiseGrid grid CBOR tag specification: <https://github.com/promisegrid/promisegrid/blob/main/docs/grid-cbor-tag-spec.md>
4. PromiseGrid wire-lab: <https://github.com/promisegrid/wire-lab>
5. PromiseGrid examples: <https://github.com/ciwg/grid-examples>
6. Wikipedia overview of Promise Theory: <https://en.wikipedia.org/wiki/Promise_theory>
7. Mark Burgess Promise Theory FAQ: <https://markburgess.org/promiseFAQ.html>
