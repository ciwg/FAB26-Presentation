# Democratised, Decentralised & Distributed Manufacturing

## Table of Contents

- [CSWG, PromiseGrid, and the Coordination Infrastructure Behind Local Production](#cswg-promisegrid-and-the-coordination-infrastructure-behind-local-production)
- [A Manufacturing Shift That Also Changes Infrastructure](#a-manufacturing-shift-that-also-changes-infrastructure)
- [Why CSWG Matters in This Context](#why-cswg-matters-in-this-context)
- [The Coordination Problem Underneath Production](#the-coordination-problem-underneath-production)
- [Why Existing Software Infrastructure Falls Short](#why-existing-software-infrastructure-falls-short)
- [PromiseGrid as a Response](#promisegrid-as-a-response)
- [Promise Theory as an Important Foundation](#promise-theory-as-an-important-foundation)
- [What a PromiseGrid Message Looks Like](#what-a-promisegrid-message-looks-like)
- [Technical Direction in Plain Language](#technical-direction-in-plain-language)
- [Governance, Stewardship, and Shared Resources](#governance-stewardship-and-shared-resources)
- [What This Could Mean for FAB26 and Beyond](#what-this-could-mean-for-fab26-and-beyond)
- [PromiseGrid as Enabling Infrastructure](#promisegrid-as-enabling-infrastructure)
- [ATP, CTP, and Promise-Shaped Coordination](#atp-ctp-and-promise-shaped-coordination)
- [Tiny Demo Ideas for a Manufacturing Audience](#tiny-demo-ideas-for-a-manufacturing-audience)
- [Why This Matters](#why-this-matters)
- [Invitation](#invitation)
- [Further Reading](#further-reading)
- [Suggested Companion Visuals and Diagrams](#suggested-companion-visuals-and-diagrams)
- [Suggested Tiny Demos](#suggested-tiny-demos)

## CSWG, PromiseGrid, and the Coordination Infrastructure Behind Local Production

Working white paper by the Community Systems Working Group.

We are writing this document for people working in fablabs, makerspaces, community workshops, small manufacturing networks, and related projects who are already asking how production can become more local, more collaborative, and less dependent on fragile centralized systems. Our purpose is not to claim that we have finished the answer. It is to explain the problem we have been working on, describe PromiseGrid as one emerging technical response, and invite others to follow the work, challenge it, and help test it as prototypes become available over the next couple of months.

## A Manufacturing Shift That Also Changes Infrastructure

The workshop theme, "Democratised, Decentralised & Distributed Manufacturing," points to a shift that many of us can already feel in practice. Manufacturing is no longer only the story of large factories, long supply chains, proprietary systems, and economies of scale. Across fablabs and adjacent communities, a different paradigm is taking shape. It values local capacity, shared knowledge, flexible production, repair, adaptation, and cooperation across small actors. This newer paradigm is often described in social, political, or economic terms, but it is also an infrastructure problem. If production becomes more distributed, then the systems used to coordinate people, machines, commitments, resources, decisions, and knowledge must become more distributed as well.

> Visual placeholder: A contrast diagram showing centralized mass production on one side and distributed local production networks on the other. The key contrast should be not only where production happens, but how coordination happens.

## Why CSWG Matters in This Context

This is where the Community Systems Working Group, or CSWG, enters the picture. CSWG describes its work as building open-source infrastructure for decentralized organizations and communities, including makerspaces, non-profits, open-source projects, and other small and medium enterprises looking for better ways to manage shared resources. Its public goals are practical and recognizable to anyone who has spent time keeping a community organization running: reduce the workload of infrastructure, increase resilience, avoid the up-front cost of conventional system buildout, reduce dependency on third-party platforms, and decrease the bottlenecks and burnout that accumulate around a few key people. Those goals matter in many domains, but they are especially relevant in small-scale manufacturing communities, where shared equipment, shared knowledge, shared scheduling, and shared stewardship are common realities rather than edge cases.

## The Coordination Problem Underneath Production

The important point is that distributed manufacturing does not fail only when a machine breaks or a part is unavailable. It also fails when coordination breaks down. A shop can have skilled people, useful machines, and active community interest, but still struggle because the operational layer is brittle. Who can reserve which machine and under what conditions. How are maintenance responsibilities tracked. How are shared inventories handled when different groups have different levels of access. How do several independent labs collaborate on production without one organization becoming the platform owner for everyone else. What happens when a key organizer steps back and tacit knowledge disappears with them. These are not secondary administrative issues. In many real communities, they are the main constraint.

> Diagram placeholder: A layered view of distributed manufacturing showing physical production at the top, community process in the middle, and digital coordination infrastructure at the base.

## Why Existing Software Infrastructure Falls Short

Traditional software infrastructure often reproduces the very concentrations of power and fragility that distributed manufacturing is trying to avoid. A centralized SaaS platform may be convenient at first, but it often creates lock-in, opaque governance, and dependence on the priorities of a vendor or host organization. A self-hosted tool stack can solve part of that problem, but it frequently shifts the burden onto a handful of administrators who become permanent operators, gatekeepers, or points of failure. Data silos multiply. Change management becomes exhausting. Access control grows ad hoc. Integration becomes harder over time rather than easier. In this sense, the challenge is not merely to choose better apps. It is to rethink the computing model underneath the apps.

## PromiseGrid as a Response

PromiseGrid is one attempt to do that. The project describes itself as a consensus-based computing, communications, and governance system designed to address problems of collaborative work and leadership in organizations and communities. Its central claim is ambitious but clear: if the internet gave us decentralized communication, perhaps we also need a decentralized computer, one owned and operated by its users rather than a single legal entity. In PromiseGrid's framing, consensus and governance are not bolt-on features. They are basic system functions exposed upward to applications and, ultimately, to users and communities. That means the same mechanisms used to manage the grid can also be used by the organizations on the grid to manage shared resources, decisions, and collaboration.

> Visual placeholder: A concept image or lightweight architecture diagram showing PromiseGrid as a shared computing substrate between individuals, organizations, devices, and applications.

## Promise Theory as an Important Foundation

An important part of the intellectual background here is Promise Theory, which is one of the underpinning inspirations behind PromiseGrid. Promise Theory starts from a simple but powerful idea: an agent can only make promises about its own behavior. It cannot truly command another agent into reliability. Cooperation happens when different agents make and keep promises that others can observe, rely on, and respond to. In practice, this means a person, machine, software service, workshop, or partner organization is best understood not simply as something to be controlled, but as a participant making certain commitments under certain conditions. That shift matters because distributed manufacturing rarely works through pure command. It works through negotiated cooperation across many semi-autonomous actors.

Promise Theory also helps clarify several ideas that are easy to blur in ordinary operations language. A promise is not the same as a demand. A request is not the same as compliance. A refusal or non-commitment is not automatically a failure. Trust is not global and abstract; it is local, relational, and built from experience of which promises are kept, broken, declined, or renegotiated. For manufacturing networks, this is a practical lens rather than a philosophical extra. A partner lab may promise fabrication capacity for a certain class of jobs, but not for every urgent request. A machine steward may promise maintenance within a certain time window, but only when parts and labor are available. A workshop may promise access to trained members, but not to untrained visitors. Promise Theory gives us language for describing these realities honestly instead of hiding them behind simplistic assumptions of centralized control.

## What a PromiseGrid Message Looks Like

It is useful to make this concrete. PromiseGrid messages are not just generic packets moving around a network. They are structured envelopes that identify what protocol is being spoken and what kind of promise is being made.

At a simple level, one active PromiseGrid pattern looks like this:

```text
grid([42(pCID), payload])
```

This is the compact form used in some constrained scenarios.

- `grid(...)`: says this is a PromiseGrid envelope
- `42(pCID)`: identifies the protocol specification being used
- `payload`: contains the actual message body defined by that protocol

For more expressive cases, a fuller envelope shape looks like this:

```text
grid([42(pCID), parents, payload, proof])
```

- `42(pCID)`: the protocol identifier
- `parents`: links to earlier related messages or objects
- `payload`: the content of the current promise
- `proof`: the signature or other proof material used to verify it

This matters because PromiseGrid is designed so that meaning is not hidden in a vague application layer. The protocol is explicit. The message shape is explicit. The relationship to earlier messages can be explicit. The proof can be explicit. That makes it easier to ask practical questions such as: who made this promise, what exactly was promised, what earlier commitment does this depend on, and what evidence supports it.

One concrete example from current work is an order-status message used in a constrained device setting:

```text
grid([42(pCID), payload])
payload = ["MSG", "gateway-bob", "m4-ivan", 1, "BT-1042", "created"]
```

In plain language, that payload says a sender is making a status promise about order `BT-1042`. Another message might acknowledge that status update. The point is not the syntax by itself. The point is that the message structure makes the promise legible.

## Technical Direction in Plain Language

For a manufacturing audience, the technical details matter only insofar as they support that larger design goal. PromiseGrid is implemented as a WASI target for portability across host operating systems and architectures, which matters because distributed production networks are unlikely to run on one standardized hardware footprint. A system like this must be able to span laptops, servers, browser tabs, phones, and low-cost devices such as Raspberry Pis. The project also uses capability-based security, which is relevant because community production environments rarely fit cleanly into all-or-nothing permissions. In practice, a lab may need fine-grained, contextual access: one person can inspect a machine log but not modify policy, another can start a workflow but only for approved jobs, and a visiting collaborator can contribute to a production task without inheriting broad administrative power. A capability-oriented model is better suited to this kind of distributed trust than many conventional role structures.

Another important design choice is that PromiseGrid treats consensus, conflict resolution, and governance as system-level building blocks. This is where the project becomes more than distributed hosting. It moves toward what the project calls computational governance. The idea is not to automate community life into a rigid machine. The idea is to make coordination rules visible, inspectable, portable, and programmable enough that groups can share infrastructure without surrendering agency. In manufacturing terms, that could eventually mean that access to tools, task handoffs, maintenance obligations, approvals, or inventory commitments are not buried in email threads, private spreadsheets, or the memory of one coordinator. Instead, they can become part of a shared operational substrate that is understandable and adjustable by the community using it.

> Diagram placeholder: A flow showing `policy -> consensus -> application behavior -> visible community outcome` with a manufacturing example such as tool booking, job approval, or shared inventory reservation.

## Governance, Stewardship, and Shared Resources

This is also where PromiseGrid intersects with a deeper governance problem that many communities experience as a tragedy-of-the-commons problem. Shared resources are vulnerable when incentives, visibility, and accountability are weak. In a fablab context, that may look like neglected maintenance, overbooked machines, missing materials, undocumented modifications, or uneven participation in the less glamorous work that keeps a space functional. PromiseGrid's public project description explicitly positions itself against these kinds of shared-resource failures. Whether or not it ultimately succeeds, that target is important. It acknowledges that resilient distributed production requires more than peer-to-peer connectivity. It requires mechanisms for stewardship.

The work done by CSWG over the last couple of years can be understood as exploratory infrastructure work in exactly this space. The public CSWG materials point to PromiseGrid and related projects as the main focus of effort. The emphasis, at least from the outside, appears to be on conceptual groundwork, architecture, proof-of-concept implementation, and learning how a more community-operated computing substrate might behave in practice. That is a sensible stage for the project. It would be a mistake to present this as a finished manufacturing platform. It is better understood as an infrastructure experiment: a serious attempt to align computing architecture with the actual needs of decentralized communities.

## What This Could Mean for FAB26 and Beyond

For FAB26, the most useful question is not whether PromiseGrid can already solve every operational challenge in a fablab. The better question is whether it points toward a class of infrastructure that distributed manufacturing will increasingly need. If local production networks grow more capable, more collaborative, and more interdependent, they will need ways to coordinate across organizations without falling back on a central operator. They will need digital systems that can support shared stewardship without requiring uniform ownership. They will need tools that work across uneven hardware conditions and mixed technical capacity. They will need software that assumes plural governance rather than pretending it does not exist. That is the direction in which PromiseGrid is interesting.

There is also a practical reason to discuss this now, before the prototypes are mature. Fablabs and small manufacturing communities are well positioned to provide exactly the kind of grounded feedback that infrastructure projects usually receive too late. Communities like these understand what shared resource management actually feels like. They know the difference between a clever systems idea and a tool that would survive a busy week in a workshop. They can spot governance friction early. They can also articulate use cases that do not always appear in abstract technical discussions: temporary machine access for visiting collaborators, cross-lab job coordination, accountable maintenance workflows, shared design and production handoff, or low-overhead collaboration between semi-autonomous groups. If PromiseGrid is going to become useful for real communities, those realities need to shape it.

> Visual placeholder: A map or network sketch showing several fablabs or community workshops sharing selected resources and commitments without one central platform owner.

## PromiseGrid as Enabling Infrastructure

One helpful way to think about PromiseGrid for this audience is as enabling infrastructure rather than end-user software. Its value, if it proves out, is not that it replaces every existing tool. Its value is that it could support a different way of composing tools, permissions, policies, and cooperative workflows across a distributed network. That matters for manufacturing because distributed production is rarely one workflow. It is many workflows crossing organizational boundaries: design files, inventory signals, training status, machine reservations, fabrication tasks, quality checks, shipping, documentation, and repair. Any digital substrate meant to support this world has to handle not just data exchange, but negotiated trust.

## ATP, CTP, and Promise-Shaped Coordination

This is also the point where familiar supply-chain language such as Available to Promise and Capable to Promise becomes useful. Available to Promise, or ATP, is about whether inventory or supply is available to fulfill demand. Capable to Promise, or CTP, is about whether the production system actually has the capacity and capability to meet that demand under the required conditions. Promise Theory provides a larger frame around those concepts. ATP and CTP can be understood not only as internal planning calculations, but as structured commitments made visible across a network. In a distributed manufacturing ecosystem, the key question is not only whether one organization believes it can deliver. It is whether the relevant promises about stock, machine time, labor, certification, logistics, and follow-through can be made clearly, shared appropriately, and trusted locally by others in the network.

Seen this way, PromiseGrid is not trying to replace manufacturing planning concepts with abstract philosophical language. It is trying to provide infrastructure where promise-shaped coordination becomes explicit. A material store can make an availability promise. A fabrication site can make a capacity promise. A machine or workshop role can make a capability promise scoped to certain jobs, tolerances, or time windows. A logistics role can promise pickup, shipment, or confirmation. Other participants can accept, decline, verify, or route around those promises without pretending that one central platform has total authority over the whole network. That is where the connection to ATP and CTP becomes practically useful.

## Tiny Demo Ideas for a Manufacturing Audience

The demos we present alongside this white paper should therefore be tiny, concrete, and immediately legible to manufacturing practitioners. They should not try to prove the whole architecture. They should simply make the infrastructure question visible.

### Distributed Machine Booking

One promising demo is a distributed machine booking scenario. Imagine two partner labs sharing access to a CNC router and a laser cutter. Instead of one lab owning the booking platform, each site runs a small node. A shared policy determines who can reserve which resources, under what conditions, and how conflicts are resolved. The demo would show a booking request, a conflicting request from another node, and a visible resolution path that reflects shared rules rather than unilateral admin override.

### Maintenance and Stewardship

Another strong demo is a maintenance and stewardship workflow. In many workshops, maintenance is everyone's responsibility in theory and no one's responsibility in practice. A tiny PromiseGrid-based example could show how a machine enters a maintenance-needed state, how restricted capabilities change automatically, how a task is offered to qualified stewards, and how restored availability depends on a transparent completion record rather than an informal message in chat. This would speak directly to the tragedy-of-the-commons framing in a context that FAB26 participants will immediately recognize.

### Shared Inventory

A third useful demo is shared inventory or material allocation across small sites. A group of labs might want to pool visibility into available stock for certain materials or components without giving one party full control over everyone's data or decisions. The demo could show lightweight commitments: one site marks a quantity as available, another requests a portion for a job, and the system records the promise, reservation, and fulfillment trail. The point is not warehouse optimization. The point is making inter-organizational coordination legible and governable.

### Distributed Work-Order Handoff

A fourth demo, if we want one that feels especially close to production-by-the-masses, is a distributed work order handoff. One site starts a small manufacturing task, discovers a capacity bottleneck, and passes a subtask to another site with the right machine, certification, or schedule window. What should travel with that handoff is not only a file, but also the permissions, commitments, and state needed for the receiving site to act without a long trail of ad hoc messages. Even a very small mockup of this idea could help the audience see why a computing and governance substrate matters.

> Demo visual placeholder: A three-column comparison showing today's likely toolchain for one workflow, the coordination failures that commonly happen, and the same workflow reimagined with shared capabilities and consensus.

If we include a code-based demo, it should remain minimal and explanatory. A good pattern would be a short example that declares a shared resource, grants a narrowly scoped capability, proposes a state change, and shows how consensus or conflict handling is surfaced. The code does not need to impress anyone with complexity. It needs to help technical participants see that governance is being treated as executable infrastructure rather than as an external management layer. If we include a visual demo instead, it should favor process clarity over UI polish.

## Why This Matters

The broader implication of all this is that distributed manufacturing may succeed or fail on the quality of its invisible systems as much as on the quality of its visible fabrication tools. Machines, materials, and designs matter, but so do the digital structures that let communities coordinate without burnout, lock-in, or loss of autonomy. If the next generation of local production networks is serious about resilience, shared ownership, and cooperation across many small actors, then infrastructure projects like PromiseGrid deserve attention even in their early stages. They are asking a foundational question: what would it take for communities not only to make things together, but also to govern the systems that make that cooperation possible?

## Invitation

That is the invitation behind this work. We hope people who encounter these ideas at FAB26, or later through this write-up, will stay close to the journey as prototypes emerge in the next couple of months. We hope some will share use cases, critiques, and design questions from their own fablabs or manufacturing communities. We hope others will want to user test early tools once they are ready. And we hope the conversation remains grounded in practice, because the real measure of this work is not whether the architecture sounds elegant. It is whether communities can use it to become more capable, more resilient, and more self-governing in the everyday work of making things together.

## Further Reading

For readers who want to go deeper, the accompanying presentation can be read alongside this paper as a shorter narrative overview. Readers may also want to explore:

1. Community Systems Working Group: <https://cswg.infrastructures.org/>
2. PromiseGrid: <https://github.com/promisegrid/promisegrid>
3. PromiseGrid wire-lab: <https://github.com/promisegrid/wire-lab>

## Suggested Companion Visuals and Diagrams

1. Centralized versus distributed manufacturing coordination model
2. Layer diagram: physical production, community process, digital infrastructure
3. PromiseGrid architecture concept for communities, applications, and devices
4. Governance flow for a machine booking or maintenance example
5. Multi-site fablab network sketch with shared but non-centralized coordination
6. Message envelope explainer showing `grid([42(pCID), ...])` with labeled slots
7. Collaboration flow sketch showing retrieval, review, and retention across several peers
8. Demo comparison graphic: ad hoc workflow versus governable shared workflow

## Suggested Tiny Demos

1. Distributed machine booking with conflict resolution
2. Maintenance stewardship workflow with changing machine availability
3. Shared inventory reservation across two or more small sites
4. Distributed work order handoff between partner workshops
5. Shared design and review flow across multiple sites
6. Visitor or trainee capability grant with narrow time-bounded permissions
