# Demo Brainstorming

## Tiny Demo Ideas for Decentralized Production

Demos should be small and concrete. Each demo should show one coordination failure and the shared record that resolves it.

### Decentralized Machine Booking

Alice and Bob both need the CNC router on Friday. Alice belongs to the host lab; Bob is visiting from a partner lab. Each site runs a small node. A shared policy decides who can reserve the router, what training or sponsorship Bob needs, and how the conflict resolves through the shared record.

### Maintenance and Stewardship

Carol hears the laser cutter making the wrong sound. She marks it as needing maintenance. Bob keeps read access to the job history. Starting a new job now requires a qualified steward to record the fix. The demo shows the promise changing state, the capability changing with it, and the machine returning to service through a visible record.

### Shared Inventory

Alice has two sheets of the right material. Bob needs one for a student build. Carol needs the other for a repair. The demo shows one site promising available stock, another site reserving part of it, and the system recording the promise, reservation, and fulfillment trail while each site keeps control of its own inventory.

### Decentralized Work-Order Handoff

Bob starts a small job and discovers that his lab is booked for the week. Carol's shop has the right machine and a free time window. The handoff carries the file, permissions, commitments, and state Carol needs. Nobody hunts through chat history.

> Demo visual placeholder: A three-column comparison showing today's likely toolchain for one workflow, the coordination failures that commonly happen, and the same workflow reimagined with shared capabilities and consensus.

A code demo can stay minimal: declare a shared resource, grant a narrowly scoped capability, propose a state change, and show how consensus or conflict handling surfaces. The demo presents governance as executable infrastructure. A visual demo should favor process clarity over UI polish.

## Suggested Companion Visuals and Diagrams

1. Existing distributed supply-chain coordination versus community-owned decentralized production infrastructure
2. Layer diagram: physical production, community process, digital infrastructure
3. PromiseGrid architecture concept for communities, applications, and devices
4. Governance flow for a machine booking or maintenance example
5. Multi-site fablab network sketch with local-node coordination
6. Message envelope explainer showing `grid([42(pCID), ...])` with labeled slots
7. Collaboration flow sketch showing retrieval, review, and retention across several peers
8. Demo comparison graphic: ad hoc workflow versus governable shared workflow

## Suggested Tiny Demos

1. Decentralized machine booking with conflict resolution
2. Maintenance stewardship workflow with changing machine availability
3. Shared inventory reservation across two or more small sites
4. Decentralized work order handoff between partner labs
5. Shared design and review flow across multiple sites
6. Visitor or trainee capability grant with narrow time-bounded permissions
