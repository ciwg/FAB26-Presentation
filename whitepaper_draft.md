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

Decentralized manufacturing requires coordination systems that fit
smaller budgets, smaller staffs, local authority, and uneven process
maturity. ERP, EDI, MES, QMS, ISO 9000, vendor portals, and formal
supply-chain standards already exist. They assume institutional weight
beyond the reach of many individuals and small groups.

> Visual placeholder: A diagram showing today's distributed
> supply-chain coordination alongside community-owned decentralized
> production infrastructure. Show where production happens and who
> governs the coordination layer.

## Community Systems Working Group (CSWG)

CSWG builds open-source infrastructure for groups, communities, and
organizations that need shared software, shared infrastructure, and
shared decisions under shared control.

## The Coordination Problem Underneath Production

A production coordination system needs to answer quesitons like these:

- Who can reserve which machine, and under what conditions?
- How are maintenance responsibilities tracked?
- How are shared inventories handled?
- How do independent sites share production while each keeps local authority?
- What happens when a key organizer steps back and tacit knowledge disappears with them?

> Diagram placeholder: A layered view of decentralized manufacturing
> showing physical production at the top, community process in the
> middle, and digital coordination infrastructure at the base.

## Why Existing Software Infrastructure Falls Short

Traditional software often implements the center that decentralized
manufacturing is trying to avoid.  Modeled after the needs of large
companies, conventional ERP, MES, and QMS software assumptions
include:

- centralized authority, uniform processes, and a single administrative domain
- large budgets, dedicated systems adminstration and operations staff
- uniformity of process and data across sites that are often
  wholly-owned subsidiaries 

By contrast, small shops and indivuduals tend to coordinate using
whatever tools are available quickly and cheaply. These tools include:

XXX get rid of the commas and periods at the end of bullet points XXX
- spreadsheets, calendars, chat threads, and booking tools,
- consumer-oriented file sharing hosts
- small-business accounting software that integrates poorly with
  everything else

## PromiseGrid as a Response

PromiseGrid is experimental decentralized computing and coordination
infrastructure for groups and communities that need shared software,
shared infrastructure, and shared decisions under local and shared
control.

PromiseGrid sits below applications. It defines lower-level building
blocks for community-owned computation: explicit promises, narrow
capabilities, consensus, and shared governance.

> Visual placeholder: A concept image or lightweight architecture
> diagram showing PromiseGrid as a shared computing substrate between
> individuals, organizations, devices, and applications.

## Promise Theory as an Important Foundation

PromiseGrid's design is based in part on [Promise
Theory](https://en.wikipedia.org/wiki/Promise_theory), by Mark Burgess
and collaborators. Promise Theory is based on principles of
voluntary cooperation and local authority, such as:

- An agent can only make promises about its own behavior. 
- An agent cannot promise what another agent will do.
- Trust is built over time from ability to keep promises.
- Trust is local, not global. Each agent makes its own trust decisions.
- Coordination is built on trust, not from authority or control.

## What a PromiseGrid Message Looks Like

PromiseGrid messages are structured envelopes. Each envelope identifies the protocol being spoken and the promise being made.

XXX replace with pCID-defined arity XXX

Compact form:

```text
grid([42(pCID), payload])
```

This compact form is used in constrained scenarios.

- `grid(...)`: says this is a PromiseGrid envelope
- `42(pCID)`: identifies the protocol specification being used
- `payload`: contains the actual message body defined by that protocol

Fuller envelope:

```text
grid([42(pCID), parents, payload, proof])
```

- `42(pCID)`: the protocol identifier
- `parents`: links to earlier related messages or objects
- `payload`: the content of the current promise
- `proof`: the signature or other proof material used to verify it

The envelope identifies the protocol, payload, prior messages, and verification material. A receiver can determine who made the promise, what payload was promised, which earlier messages it depends on, and which proof verifies it.

Tools, machines, people, and organizations must read the same manufacturing commitments. A machine access grant, maintenance status change, work-order handoff, inventory reservation, or capacity promise needs a life outside one application's database or one chat channel. PromiseGrid makes these commitments portable, inspectable, and governable outside any single app.

The same `grid(...)` message bytes are also intended to be transport-agnostic. They can be carried by online transports such as TCP, HTTP, or WebSocket, and also by slower or more asynchronous paths such as version-control history, file transfer, or a thumb drive.

Current constrained-device example:

```text
grid([42(pCID), payload])
payload = ["MSG", "gateway-bob", "m4-ivan", 1, "BT-1042", "created"]
```

Payload meaning: the sender promises status `created` for order `BT-1042`. A later message can acknowledge that status update. The syntax is the carrier; the message structure makes the promise legible.

## Technical Details in Plain Language

In the current prototype architecture:

- Stage0 is a small installed `grid` bootstrap that can fetch, verify,
  approve, and start a fetched local runtime layer.
- Stage1 provides daemon roles, transport, CAS/VCS, parser/builders,
  capability checks, and app execution support.
- WASI/WASM remains one planned portable app/runtime profile under
  stage1, including WASM in browser tabs.

PromiseGrid uses capability-based security.
Capability tokens match decentralized trust:

- Carol can give Alice a capability token that allows her to read a
  file, but not write it.
- Ellen can give Bob a capability token that allows him to use machine
  A, but not machine B.

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
forms, and slicers. It carries tools, permissions, policies, and
cooperative workflows across a decentralized network. Decentralized
production joins design files, inventory signals, training status,
machine reservations, fabrication tasks, quality checks, shipping,
documentation, and repair across organizational boundaries. The
substrate must carry data and negotiated trust.

## ATP, CTP, and Promise-Shaped Coordination

Supply chains already use some promise terms:

- ATP: inventory or supply available for demand.
- CTP: capacity and capability available under the required conditions.

Promise Theory gives ATP and CTP a network form: structured
commitments visible across organizations.

PromiseGrid gives those promises an open network protocol; rather than
being locked into a single vendor's software, the commitments can be
shared across organizations and applications.

## References

1. Community Systems Working Group: <https://cswg.infrastructures.org/>
2. PromiseGrid: <https://github.com/promisegrid/promisegrid>
3. PromiseGrid wire-lab: <https://github.com/promisegrid/wire-lab>
5. PromiseGrid examples: <https://github.com/ciwg/grid-examples>
6. Wikipedia overview of Promise Theory: <https://en.wikipedia.org/wiki/Promise_theory>
7. Mark Burgess Promise Theory FAQ: <https://markburgess.org/promiseFAQ.html>
