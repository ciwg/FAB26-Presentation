class: center, middle

<!-- Slide 1. Locate the talk in the workshop theme. -->

# Toward Community-Owned Infrastructure for Distributed Manufacturing

PromiseGrid

Community Systems Working Group

Show & Tell: Democratised, Decentralised & Distributed Manufacturing

???

This is a talk about the digital and organizational infrastructure underneath distributed manufacturing: how communities coordinate work, share capacity, make commitments, and govern the systems they depend on.

---

<!-- Slide 2. Set expectations for the talk arc. -->

# Outline

- Why distributed manufacturing needs community-owned coordination infrastructure
- The community infrastructure problem CSWG is addressing
- Promise Theory as a practical coordination language
- PromiseGrid's model for community-owned computation and governance
- Current experiments and technical building blocks
- What this could enable for local production networks

???

I will start with the manufacturing context, move into the coordination problem, introduce Promise Theory as a language for that problem, then show PromiseGrid as an infrastructure experiment. I will close by tying the technical work back to what local production networks might gain if this becomes practical.

---

<!-- Slide 3. Do not imply distributed manufacturing is not already happening. -->

# Distributed manufacturing already exists. The question is who can govern it.

- Global supply chains are already distributed across firms, factories, logistics, and software systems
- Small fabs and community networks rarely own or govern the coordination layer they depend on
- PromiseGrid explores open infrastructure for shared coordination, commitments, and local trust

???

Distributed manufacturing is already happening today through global supply chains, contract manufacturing, vendor platforms, logistics systems, and proprietary integrations. The question for fablabs and small production networks is different: what would let distributed manufacturing become more democratic, decentralized, and governable by the communities doing the work? That question is about the less visible infrastructure that lets communities coordinate production, share resources, and govern systems together without recreating centralized dependencies. Fablabs already know that a lab is more than machines. It is schedules, training, maintenance, trust, access, handoffs, and the quiet work of keeping everything usable.

---

<!-- Slide 4. Connect the talk to the workshop framing and other presenters. -->

# The missing layer is governable coordination

- Small fabs coordinate through calendars, spreadsheets, chat, booking tools, file stores, and machine interfaces
- ERP, MES, SaaS, and vendor ecosystems often assume central control, larger budgets, or closed integrations
- The hard question is how independent sites cooperate without one platform becoming the center

???

The visible production layer gets attention first: machines, files, materials, and skills. But underneath it is a coordination layer. In many small shops that layer is stitched together from tools that were not designed for shared governance across independent organizations. If that layer stays centralized, fragile, or dependent on one vendor or one exhausted organizer, then the network inherits the same weaknesses it was trying to move away from.

---

<!-- Slide 5. Based on CSWG About Us and Goals pages. Keep this grounded. -->

# CSWG started with a simple problem: communities burn out on infrastructure

- CSWG builds open-source infrastructure for decentralized organizations and communities
- Focus areas include makerspaces, non-profits, open-source projects, and small to medium enterprises
- Goal: reduce workload and increase resiliency so people can focus on the work they care about

???

CSWG did not start from an abstract fascination with decentralization. It started from a familiar pattern: too much hidden coordination work, too much reliance on admins, too many brittle tools, too much lock-in, and too many important responsibilities living in the memory of a few key people. In a fablab or community makerspace, that can show up as machine access, safety training, inventory, maintenance, documentation, finances, governance, or cross-site projects.

---

<!-- Slide 6. Pivot from production capacity to coordination capacity. -->

# The bottleneck is not just production capacity. It is coordination capacity.

- Shared work depends on managing access, commitments, decisions, machine state, and conflict
- Work orders, maintenance, inventory, permissions, and evidence of completion often live in separate tools
- Traditional infrastructure creates silos, fragility, and dependence on a few key operators
- In community production systems, those gaps become governance problems as much as technical ones

???

A distributed manufacturing network can have skilled people and useful machines and still struggle because coordination is too fragile. Who can reserve which machine and under what conditions? Who is allowed to approve a job? Who promises maintenance? What happens when two labs depend on the same material stock? What happens when one site cannot complete a task and another site might be able to pick it up? These are operational questions, but they are also governance questions.

---

<!-- Slide 7 -->

# Promise Theory gives language for distributed coordination

- An agent can only promise its own behavior
- Requests are not the same as compliance
- Non-commitment is not the same as failure
- Trust is local and built from experience

???

Promise Theory is useful here because it starts from a very practical observation: in a distributed system, you cannot simply command reliability into existence. A person, lab, machine, software service, or partner organization can make promises about what it will do under certain conditions. Others can decide whether to rely on those promises based on experience. That sounds theoretical at first, but it is exactly how shared production already works. A machine steward promises to maintain a tool. A lab promises trained-member access. A supplier promises material availability. A partner site promises capacity for a certain kind of job, but not for every request.

---

<!-- Slide 8. Bridge into manufacturing promise language. -->

# ATP and CTP already make promises visible in manufacturing

- Available to Promise asks: what supply can actually be committed?
- Capable to Promise asks: what production capacity can actually be committed?
- Distributed production needs those commitments across stock, machines, labor, logistics, and collaboration

???

Available to Promise, or ATP, asks whether inventory or supply can actually be committed to demand. Capable to Promise, or CTP, asks whether the production system has the capacity and capability to meet that demand under the required conditions. PromiseGrid is not trying to replace that language with something more abstract. It is asking what infrastructure would let these promise-shaped commitments become explicit, shareable, and locally trustworthy across a network of independent sites.

---

<!-- Slide 9. Based on the original PromiseGrid README. Use the original framing carefully. -->

# PromiseGrid is a decentralized computing infrastructure beneath the app layer

- PromiseGrid is an open-source, compact, consensus-based computing protocol for machine-to-machine communication, adaptable across desktops, VMs, containers, and IoT devices
- Not another shop app or a finished manufacturing platform
- A substrate for promises, capabilities, consensus, auditable handoffs, and shared governance
- Core idea: communities own and operate the coordination layer rather than depending on one hosting entity

???

If the internet gave us decentralized communication, PromiseGrid asks what decentralized computation might look like. For this audience, the key point is not the slogan. The key point is ownership and governability. A fablab network should not have to choose between an easy centralized platform and an unmaintainable pile of local tools. PromiseGrid is one experiment in a third possibility: shared computation, communication, and governance infrastructure operated by the people and communities who rely on it.

---

<!-- Slide 10. For technically curious people; keep it high-level and legible. -->

# The technical model combines portability, capabilities, consensus, and local trust

- WASI helps code run across different devices and operating systems
- Capability-based security supports scoped authority instead of all-or-nothing admin power
- Consensus and governance are treated as system-level building blocks
- Current work tests containers, TCP exchange, CBOR `grid(...)` messages, CWT/COSE capability tokens, CAS, CAR transfer, peer sync, retention, and Git bridge experiments

???

WASI matters because distributed manufacturing will not run on one clean hardware footprint. Capability-based security matters because shops need narrow, contextual permissions: inspect a machine log but do not change policy, start an approved workflow but not any workflow, contribute to a job without inheriting every privilege. The recent wire-lab work is testing those ideas in more concrete ways: containerized agents exchanging exact messages over TCP, signed capability tokens, content-addressed storage, object transfer, peer sync, retention promises, and Git bridge experiments.

---

<!-- Slide 11. Keep the technical explainer tied to operations. -->

# A PromiseGrid message is explicit about what is being promised

- Compact form: `grid([42(pCID), payload])`
- Richer form: `grid([42(pCID), parents, payload, proof])`
- `pCID` identifies the protocol
- `payload` carries the promise content
- `parents` and `proof` connect context, evidence, and verification

```text
grid([42(pCID), payload])
payload = ["MSG", "gateway-bob", "m4-ivan", 1, "BT-1042", "created"]
```

???

The message is not just a vague packet. The envelope says: this is a PromiseGrid message, this is the protocol being spoken, this is the promise content, and in richer cases this is the earlier context and proof material. In the example, one participant is making an order-status promise about order `BT-1042`. The important point is not the syntax by itself. It is the legibility of the commitment: who is saying what, under what protocol, with what context, and what evidence can be checked later. In a manufacturing setting, the same pattern could eventually apply to machine access, maintenance state, inventory reservation, capacity promises, or work-order handoffs.

---

<!-- Slide 12. Summarize recent work without drowning people in proof-of-concept numbers. -->

# Current experiments are testing workflows, devices, containers, sync, and collaboration

- Workflow experiments: shipping, accounting, device roles, evidence, and trust
- Device experiments: compact radio-visible messages, restart recovery, and constrained participation
- Collaboration experiments: peer retrieval, sync, retention, storage promises, and Git bridge work
- Runtime experiments: containers, TCP sessions, capability tokens, CAS stores, and CAR payload transfer

???

The project is still experimental, but the work has moved beyond broad architecture. It is testing production-adjacent coordination problems: how roles exchange evidence, how small devices participate, how peers retrieve and retain objects, how collaboration can happen without one site becoming the central authority, and how infrastructure can remain auditable after the fact.

---

<!-- Slide 13. Link the talk back to the wider workshop. -->

# If this works, local production networks gain more governable infrastructure

- Less dependence on centralized SaaS and fragile gatekeepers
- More resilient coordination across organizations, tools, and devices
- Better support for community ownership, open protocols, shared stewardship, and adaptable governance
- A stronger foundation for production ecosystems that are already distributed but not yet community-governable

???

The goal is not decentralization for its own sake. The goal is governable resilience. Fablabs and small manufacturing networks need ways to share selected resources, commitments, and workflows without surrendering control to one platform owner. If PromiseGrid or something like it proves useful, it could become enabling infrastructure underneath many tools rather than a single app that replaces everything.

---

<!-- Slide 14. End on an invitation rather than a hard sell. -->

# Can communities own the systems that make cooperation possible?

- Distributed manufacturing is already a coordination reality
- Democratic and decentralized manufacturing requires deeper, governable infrastructure
- CSWG and PromiseGrid are looking for collaborators, critics, and early testers

???

This is active work, not a finished manufacturing platform. The best outcome from FAB26 would be people who want to follow the journey, share grounded use cases, challenge the assumptions, and help test prototypes as they emerge. The communities in this room understand the difference between a clever systems idea and something that can survive a busy week in a shop. The closing question is what it would take for communities not only to make things together, but to own and govern the systems that make that cooperation possible.
