## Decision Intent Log

ID: DI-zovom
Date: 2026-07-23 12:15:35
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Track the remaining FAB26 white paper cleanup as TODO `sukat`.
Intent: Keep the next white paper edits explicit, audience-focused, and easy to review while aligning the document with FAB26, the fablab movement, current slides, and current PromiseGrid prototype evidence.
Constraints: Keep changes minimal and directly tied to these tasks; avoid wholesale rewrites; reduce jargon and verbosity; keep slides free of visible DI/DR/TODO/TE references; use white paper footnotes and a bottom `## References` section only when internal DI/DR/TODO/TE references are useful to readers.
Affects: `whitepaper_draft.md`, `README.md`, `TODO/TODO.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-mihif
Date: 2026-07-23 13:26:07
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Make smaller white paper corrections for scale framing, project voice, and Promise Theory references.
Intent: Keep the next white paper edit narrow and reviewable after the broader style pass was rejected, while correcting the scale framing of existing manufacturing infrastructure, using first-person PromiseGrid project voice, and adding public Promise Theory references.
Constraints: Keep the diff minimal and reviewable; do not rewrite the outline; touch only the agreed white paper paragraphs, mechanical workshop-as-place fixes, and this TODO record.
Affects: `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-limib
Date: 2026-07-23 14:52:03
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Break `sukat.9` into section-specific subtasks and align the white paper with the main PromiseGrid README.
Intent: Make the white paper more generally about PromiseGrid in decentralized manufacturing and supply chains for fablabs, makerspaces, small shops, and individuals, while keeping edits minimal and traceable by section.
Constraints: Keep changes section-local and reviewable; do not rewrite paragraphs that do not need README alignment or audience generalization; do not touch slides.
Affects: `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

# TODO sukat - Clean Up FAB26 White Paper

## Audience and Structure

- [x] sukat.1 Reframe generic "manufacturing audience" language.
  Replace broad "manufacturing audience" phrasing with wording aimed at fablabs, decentralized manufacturing, distributed production communities, makers, educators, artists, academics, industry experts, and policymakers where appropriate. Keep the focus on "Democratised, Decentralised & Distributed Manufacturing" and "Decentralized Manufacturing Working Group: People, Practices, and Infrastructure."
- [x] sukat.2 Replace awkward "current direction" wording.
  Prefer "current prototype architecture" when describing stage0/stage1, and "recent proof-of-concept work points toward..." when grounding claims in wire-lab evidence.
- [x] sukat.3 Reduce the wall-of-text problem.
  Make the white paper less verbose and more scannable with shorter paragraphs, bullets, and other structure. Reduce jargon where possible, explain unavoidable terms plainly, and make the document feel more practical, participatory, and oriented toward learning, building, sharing, and local capacity.
- [x] sukat.12 Make smaller white paper corrections.
  Correct the scale framing in the distributed-manufacturing section, replace third-person project-description wording, and add Promise Theory references without doing a broad style rewrite.

## Technical Alignment

- [x] sukat.4 Fix the WASI-centered technical claim.
  `whitepaper_draft.md` no longer says PromiseGrid "is implemented as a WASI target." Commit `3d6cd39` replaced that with stage0/stage1 prototype framing and planned WASI/WASM support under stage1, including browser-tab WASM.
- [ ] sukat.5 Update the "current work" paragraph to match the slide deck.
  The slide deck names workflows, devices, containers/TCP, CBOR `grid(...)`, CWT/COSE tokens, CAS, CAR transfer, peer sync, retention, and Git bridge experiments. Absorb that into the `whitepaper_draft.md` technical-direction section without overloading readers.
- [ ] sukat.6 Tighten the message-shape explanation.
  `whitepaper_draft.md` presents compact and fuller forms cleanly, but POC16 is more precise: pCID owns arity, slot meaning, signable view, proof location, and payload interpretation. Say the shown forms are examples, not universal shapes. Mention COSE-as-payload and COSE-as-proof only if it helps the reader.
- [ ] sukat.7 Add the POC18 collaboration/CAS substrate.
  Explain sparse CAS, versioned reference sets, local trust, continuous peer DAG sync, retention/storage promises, review promises, and Git as a bridge rather than native authority. Put this near `PromiseGrid as Enabling Infrastructure` or in the technical-direction section.
- [ ] sukat.8 Add POC19's production-shaped direction carefully.
  POC19 is a design draft, not executable code or a production API. Phrase it as prototype or near-term production-shaped design work. Useful audience-facing points include `grid daemon`, `grid run <app-ref>`, apps/data as CAS/VCS objects, local approval of roots/capabilities, outputs as CIDs, and TCP/WebSocket carrying the same exact message bytes.
- [x] sukat.9 Bring the white paper closer to the main PromiseGrid README.
  Align audience and README context via section-specific subtasks.
- [x] sukat.9.1 Title and TOC: add supply-chain framing and update affected anchors only.
- [x] sukat.9.2 Opening section: replace FAB26 event framing with general white paper framing.
- [x] sukat.9.3 Industrial-scale section: keep scale framing and mention supply-chain systems only as needed.
- [x] sukat.9.4 CSWG section: align with README language about shared software, infrastructure, and decisions without one operator.
- [x] sukat.9.5 PromiseGrid response section: bring in README's experimental decentralized computing and coordination framing.
- [x] sukat.9.6 Technical direction section: add minimal README prototype-status context.
- [x] sukat.9.7 "What This Could Mean..." section: retitle away from FAB26 and generalize audience/use cases.
- [x] sukat.9.8 Enabling infrastructure section: mention supply-chain coordination where it fits naturally.
- [x] sukat.9.9 Demo section title/lead: make the audience generic without doing the larger `sukat.10` demo rewrite.
- [x] sukat.9.10 Invitation/Further Reading: remove FAB26-specific invitation language and add the README repo split.

## Demos and Provenance

- [ ] sukat.10 Shorten or relabel the demo section.
  Align `whitepaper_draft.md` demo ideas with the slides' higher-level "current experiments" framing. Add "shared design/review flow" and "app fetch/run from CAS/VCS" as candidate demos. Make clear the demos are illustrative, not proof that decentralized manufacturing apps are done.
- [ ] sukat.11 Handle provenance without making public artifacts noisy.
  Keep slides visually clean. If the white paper names DI/DR/TODO/TE records, use GitHub Markdown footnotes plus a bottom `## References` section with relative repo paths. For POC evidence, prefer audience-facing prose; only add internal IDs if they are genuinely useful to readers.
