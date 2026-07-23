## Decision Intent Log

ID: DI-zovom
Date: 2026-07-23 12:15:35
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Track the remaining FAB26 white paper cleanup as TODO `sukat`.
Intent: Keep the next white paper edits explicit, audience-focused, and easy to review while aligning the document with FAB26, the fablab movement, current slides, and current PromiseGrid prototype evidence.
Constraints: Keep changes minimal and directly tied to these tasks; avoid wholesale rewrites; reduce jargon and verbosity; keep slides free of visible DI/DR/TODO/TE references; use white paper footnotes and a bottom `## References` section only when internal DI/DR/TODO/TE references are useful to readers.
Affects: `whitepaper_draft.md`, `README.md`, `TODO/TODO.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

# TODO sukat - Clean Up FAB26 White Paper

## Audience and Structure

- [x] sukat.1 Reframe generic "manufacturing audience" language.
  Replace broad "manufacturing audience" phrasing with wording aimed at fablabs, decentralized manufacturing, distributed production communities, makers, educators, artists, academics, industry experts, and policymakers where appropriate. Keep the focus on "Democratised, Decentralised & Distributed Manufacturing" and "Decentralized Manufacturing Working Group: People, Practices, and Infrastructure."
- [x] sukat.2 Replace awkward "current direction" wording.
  Prefer "current prototype architecture" when describing stage0/stage1, and "recent proof-of-concept work points toward..." when grounding claims in wire-lab evidence.
- [x] sukat.3 Reduce the wall-of-text problem.
  Make the white paper less verbose and more scannable with shorter paragraphs, bullets, and other structure. Reduce jargon where possible, explain unavoidable terms plainly, and make the document feel more practical, participatory, and oriented toward learning, building, sharing, and local capacity.

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
- [ ] sukat.9 Bring the white paper closer to the main PromiseGrid README.
  The main README frames PromiseGrid as experimental decentralized computing and coordination for groups that need shared software, infrastructure, and decisions without one operator. It also says current executable work is still prototype work and split across `wire-lab`, `promisegrid-dev-guide`, and `grid-examples`. Add that context and avoid implying prototypes will simply become available over the next couple of months.

## Demos and Provenance

- [ ] sukat.10 Shorten or relabel the demo section.
  Align `whitepaper_draft.md` demo ideas with the slides' higher-level "current experiments" framing. Add "shared design/review flow" and "app fetch/run from CAS/VCS" as candidate demos. Make clear the demos are illustrative, not proof that decentralized manufacturing apps are done.
- [ ] sukat.11 Handle provenance without making public artifacts noisy.
  Keep slides visually clean. If the white paper names DI/DR/TODO/TE records, use GitHub Markdown footnotes plus a bottom `## References` section with relative repo paths. For POC evidence, prefer audience-facing prose; only add internal IDs if they are genuinely useful to readers.
