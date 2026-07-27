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

ID: DI-movaf
Date: 2026-07-23 15:13:41
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Tighten repeated audience and supply-chain framing introduced by `sukat.9`.
Intent: Keep the white paper generally about decentralized manufacturing while mentioning supply-chain coordination only where it adds meaning, and define the audience once instead of repeating long lists.
Constraints: Keep edits small and section-local; do not rewrite the paper; do not touch slides, diagrams, references, or unrelated paragraphs.
Affects: `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-sifan
Date: 2026-07-25 14:18:45
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Add public prose style rules and apply an incremental white paper tone cleanup.
Intent: Reduce defensive rhythm, condescension, filler, and AI-sounding prose while preserving the white paper outline and current technical claims.
Constraints: Keep edits section-local and reviewable; do not add graphics; do not touch slides; preserve stage0/stage1 and WASI/WASM wording.
Affects: `AGENTS.md`, `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-napul
Date: 2026-07-25 15:10:01
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Prefer "decentralized" over "distributed" for the white paper's target coordination model.
Intent: Make the paper distinguish distributed production coordinated by a central controller from decentralized, mesh-like production coordination.
Constraints: Keep industrial-scale distributed manufacturing language where it is the contrast case; keep edits minimal and section-local.
Affects: `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-dakog
Date: 2026-07-25 15:18:15
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Replace stale terminology phrasing in current public prose guidance and the white paper terminology note.
Intent: Keep the paper and prose rules direct, plain, and less AI-sounding.
Constraints: Re-read the current white paper before editing; preserve manual edits; keep append-only DI history unchanged.
Affects: `AGENTS.md`, `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-dogol
Date: 2026-07-25 15:27:06
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Replace committee-style white paper passages with active, concrete prose.
Intent: Make the white paper read less like third-party summary and more like a human explanation grounded in people, shared spaces, and real coordination failures.
Constraints: Re-read the current white paper before editing; preserve technical stage0/stage1, WASI/WASM, and transport-agnostic message content; keep edits section-local and reviewable.
Affects: `AGENTS.md`, `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-dijud
Date: 2026-07-25 15:30:14
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Remove positive/negative balance scaffolding from the white paper style pass.
Intent: Stop exhausting both-sided prose patterns and make each paragraph state the useful point directly.
Constraints: Preserve current technical content; keep the edit focused on prose framing and the Promise Theory passage called out by the user.
Affects: `AGENTS.md`, `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-vovab
Date: 2026-07-25 15:32:46
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Use RFC-like prose for the next white paper style pass.
Intent: Make the white paper definitive, specific, and to the point; remove mush while preserving the current technical content.
Constraints: Keep the edit sentence-local where possible; avoid outline rewrites; preserve stage0/stage1, WASI/WASM, and transport-agnostic `grid(...)` content.
Affects: `AGENTS.md`, `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-latal
Date: 2026-07-25 15:37:03
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Move demo brainstorming out of the white paper.
Intent: Keep the white paper focused on the core argument while preserving demo and visual ideas in a separate reviewable document.
Constraints: Move content without rewriting it; create `demo-brainstorming.md`; leave a minimal pointer from the white paper.
Affects: `whitepaper_draft.md`, `demo-brainstorming.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-tavol
Date: 2026-07-25 16:36:50
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Update the white paper message-shape section to use pCID-defined slot wording.
Intent: Align the public explanation with current wire-lab POC16 and POC19 wording: slot 0 selects the protocol spec, and that spec defines the rest of the message.
Constraints: Keep the edit local to the message-shape section and this TODO record; use direct positive wording; keep examples as examples.
Affects: `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-jopam
Date: 2026-07-25 17:35:03
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Align the white paper with current PromiseGrid good-practice terminology.
Intent: Add concise public wording for CID wire/print discipline, pCID parser/builder roles, CWT/COSE capability tokens, CAS/VCS substrate, glossary terms, and the grid CBOR tag reference without broad rewrites.
Constraints: Keep edits local to the white paper technical sections, glossary, references, and this TODO record; preserve 74-column wrapping; do not create a new TODO file.
Affects: `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-tozok
Date: 2026-07-25 18:00:23
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Add external glossary references to the white paper.
Intent: Help readers find authoritative definitions for externally defined glossary terms while keeping the public prose and existing structure unchanged.
Constraints: Touch only `whitepaper_draft.md` glossary/references and this TODO DI log; use numbered public references, not internal DI/DR/TODO/TE footnotes; avoid unrelated prose cleanup.
Affects: `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-zuzul
Date: 2026-07-26 12:10:30
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Use GFM footnote citations for public white paper references.
Intent: Let body text and glossary entries link to the bottom References section while keeping citation labels stable and readable.
Constraints: Touch only `whitepaper_draft.md` citation syntax and this append-only TODO DI entry; keep prose changes minimal; preserve the existing reference targets; do not touch slides.
Affects: `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`
Supersedes: DI-tozok

ID: DI-hobor
Date: 2026-07-26 12:35:39
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Add public citations for industrial-scale coordination terms.
Intent: Let readers inspect neutral or authoritative definitions for ERP, EDI, MES, QMS, and ISO 9000 without expanding the white paper prose.
Constraints: Touch only the existing industrial-scale sentence, bottom reference definitions, and this append-only TODO DI entry; keep the visible-URL reference style; do not touch slides.
Affects: `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-rodos
Date: 2026-07-26 15:39:09
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Credit Internet of Production and document CSWG lineage.
Intent: Credit IoP's decentralized manufacturing standards work, distinguish PromiseGrid's coordination-infrastructure layer, and document CSWG's lineage through Nation of Makers and White House/OSTP maker organizing.
Constraints: Touch only the new IoP section, the CSWG lineage paragraph, bottom reference definitions, and this append-only TODO DI entry; keep visible-URL reference style; do not touch slides.
Affects: `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-japit
Date: 2026-07-26 15:46:56
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Move the white paper URL checker into repo tools.
Intent: Keep the URL validation script reviewable and reusable while preserving `/tmp` for runtime outputs.
Constraints: Add `tools/fab26-urlcheck.sh`; keep output under `/tmp`; keep the checker's reference coverage aligned with current white paper references.
Affects: `tools/fab26-urlcheck.sh`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-kotil
Date: 2026-07-26 16:07:26
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: State that CSWG develops PromiseGrid.
Intent: Make the white paper explicit that PromiseGrid is a CSWG-developed infrastructure project.
Constraints: Keep the edit local to the CSWG section and this append-only TODO DI entry; do not touch slides or unrelated white paper prose.
Affects: `whitepaper_draft.md`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-kimug
Date: 2026-07-26 16:25:08
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Add citations for the PromiseGrid heritage paragraph.
Intent: Let readers trace the named systems-management, grid-computing, infrastructure-architecture, and DevOps influences without expanding the heritage paragraph beyond the user's requested scope.
Constraints: Touch only the heritage paragraph, bottom reference definitions, URL checker coverage, and this append-only TODO DI entry; prefer Wikipedia links where available.
Affects: `whitepaper_draft.md`, `tools/fab26-urlcheck.sh`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-fujid
Date: 2026-07-26 21:34:26
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Replace NIST glossary references for MES and CAS.
Intent: Use more reader-facing public references for Manufacturing Execution System and content-addressable storage while keeping the white paper prose and footnote keys stable.
Constraints: Touch only the MES and CAS reference definitions, the matching URL checker entries, and this append-only TODO DI entry.
Affects: `whitepaper_draft.md`, `tools/fab26-urlcheck.sh`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-vujop
Date: 2026-07-27 09:57:24
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Extend the white paper URL checker to emit LLM review artifacts.
Intent: Let the checker keep its deterministic fetch and marker checks while also producing a review index that points an LLM or human at full fetched pages, extracted text, headers, citation keys, and expected support statements.
Constraints: Keep fetched HTML, headers, extracted text, and review output under `/tmp/fab26-urlcheck`; do not commit fetched runtime artifacts; do not edit white paper prose or references in this change.
Affects: `tools/fab26-urlcheck.sh`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-filun
Date: 2026-07-27 11:34:18
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Add a DAG glossary entry and citation.
Intent: Define DAG at first use in the CAS history discussion and give readers a visible external reference without rewriting nearby prose.
Constraints: Touch only the first DAG use, the glossary, the reference list, the matching URL checker entry, and this append-only TODO DI entry.
Affects: `whitepaper_draft.md`, `tools/fab26-urlcheck.sh`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

ID: DI-fisan
Date: 2026-07-27 12:04:24
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Check and cover the reference-sets citation.
Intent: Keep the user-added reference-sets citation and glossary entry, add matching URL checker coverage, and fix only blocking mechanical issues found during review.
Constraints: Preserve the user's reference-sets wording except for typo and trailing-whitespace cleanup; do not rewrite surrounding prose.
Affects: `whitepaper_draft.md`, `tools/fab26-urlcheck.sh`, `TODO/TODO-sukat-whitepaper-fab26-cleanup.md`

# TODO sukat - Clean Up FAB26 White Paper

## Audience and Structure

- [x] sukat.1 Reframe generic "manufacturing audience" language.
  Replace broad "manufacturing audience" phrasing with wording aimed at fablabs, decentralized manufacturing, distributed production communities, makers, educators, artists, academics, industry experts, and policymakers where appropriate. Keep the focus on "Democratised, Decentralised & Distributed Manufacturing" and "Decentralized Manufacturing Working Group: People, Practices, and Infrastructure."
- [x] sukat.2 Replace awkward "current direction" wording.
  Prefer "current prototype architecture" when describing stage0/stage1, and "recent proof-of-concept work points toward..." when grounding text in wire-lab evidence.
- [x] sukat.3 Reduce the wall-of-text problem.
  Make the white paper less verbose and more scannable with shorter paragraphs, bullets, and other structure. Reduce jargon where possible, explain unavoidable terms plainly, and make the document feel more practical, participatory, and oriented toward learning, building, sharing, and local capacity.
- [x] sukat.12 Make smaller white paper corrections.
  Correct the scale framing in the distributed-manufacturing section, replace third-person project-description wording, and add Promise Theory references without doing a broad style rewrite.
- [x] sukat.13 Tighten repeated audience and supply-chain framing.
  Remove repeated "and Supply Chains" title/heading phrasing, define the audience once, and keep supply-chain wording only where it adds meaning.
- [x] sukat.14 Reduce defensive and AI-sounding prose rhythm.
  Add AGENTS guidance for public prose style and make a narrow white paper pass that prefers direct statements, concrete examples, shorter paragraphs, and course-takeaway rhythm where technically accurate.
- [x] sukat.15 Clarify distributed versus decentralized terminology.
  Prefer "decentralized" for the target PromiseGrid manufacturing model while preserving "distributed" where it describes existing industrial-scale coordination spread across many sites but still centrally controlled.
- [x] sukat.16 Replace stale terminology phrasing in live prose.
  Re-read the current white paper, preserve manual edits, and replace the wording in the terminology note and public prose guidance.
- [x] sukat.17 Replace committee-style prose with human examples.
  Re-read the white paper and make a focused pass that uses active voice, Alice/Bob/Carol examples, less contrived decentralized manufacturing scenarios, and durable prose-style guidance.
- [x] sukat.18 Remove positive/negative balance scaffolding.
  Replace the Promise Theory contrast chain and nearby both-sided prose with direct statements about promises, records, authority, and shared work.
- [x] sukat.19 Make prose RFC-like.
  Replace mushy white paper language with definitive, specific, to-the-point statements while preserving the technical content.
- [x] sukat.20 Move demo brainstorming out of the white paper.
  Move demo idea sections and visual brainstorming lists into `demo-brainstorming.md`, leaving only a pointer in the white paper.

## Technical Alignment

- [x] sukat.4 Fix the WASI-centered technical statement.
  `whitepaper_draft.md` no longer says PromiseGrid "is implemented as a WASI target." Commit `3d6cd39` replaced that with stage0/stage1 prototype framing and planned WASI/WASM support under stage1, including browser-tab WASM.
- [ ] sukat.5 Update the "current work" paragraph to match the slide deck.
  The slide deck names workflows, devices, containers/TCP, CBOR `grid(...)`, CWT/COSE tokens, CAS, CAR transfer, peer sync, retention, and Git bridge experiments. Absorb that into the `whitepaper_draft.md` technical-direction section without overloading readers.
- [x] sukat.6 Tighten the message-shape explanation.
  `whitepaper_draft.md` now presents `grid([42(pCID), ...protocol-defined-slots])` as the outer shape. Slot 0 selects the protocol spec, and the spec defines slot count, slot meanings, payload shape, signable bytes, and proof placement.
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
