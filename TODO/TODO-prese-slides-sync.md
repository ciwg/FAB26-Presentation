## Decision Intent Log

ID: DI-rizuz
Date: 2026-07-25 18:22:38
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Track slide synchronization work under TODO `prese`.
Intent: Convert the draft slide-sync notes into standard TODO form and
capture the priority slide updates found by comparing `README.md`,
`whitepaper_draft.md`, and `~/lab/wire-lab/GOOD-PRACTICES.md`.
Constraints: Update TODO tracking only; do not edit the slide deck in
this pass; preserve the existing `prese` handle; integrate findings 1-3,
5, 6, and 7 from the slide review.
Affects: `TODO/TODO-prese-slides-sync.md`, `TODO/TODO.md`

ID: DI-lizim
Date: 2026-07-25 18:26:26
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Sync the slide deck with current white paper and GOOD-PRACTICES wording.
Intent: Correct the slide deck's pCID-defined message shape, signature wording, payload example, stage1 runtime framing, distributed/decentralized terminology, and capability/event vocabulary while keeping public slides visually clean.
Constraints: Keep edits local to `README.md` and this TODO record; do not add DI/DR/TODO/TE references to slides; preserve the existing slide structure.
Affects: `README.md`, `TODO/TODO-prese-slides-sync.md`, `TODO/TODO.md`

# TODO prese - Sync Slides With White Paper and Good Practices

## Message Shape

- [x] prese.1 Fix Slide 11 so `proof` is not presented as the normal
  richer message slot.
  Use `signature` or pCID-defined proof/signature wording, because
  GOOD-PRACTICES says not to add a separate `proof` field when a token
  or COSE object already carries the relevant signature unless the pCID
  defines why both are needed.
- [x] prese.2 Fix Slide 11 so
  `grid([42(pCID), ...protocol-defined-slots])` is the primary message
  shape.
  Keep `grid([42(pCID), payload])` and
  `grid([42(pCID), parents, payload, signature])` as examples, not
  universal shapes. Make clear that pCID determines slot arity and slot
  meaning.
- [x] prese.3 Reconcile Slide 11's example payload with the white paper.
  Remove the extra `1` from the slide payload unless it is deliberate
  protocol data; if it is deliberate, document what it means in the
  slide notes.

## Runtime Architecture

- [x] prese.5 Fix Slide 10 so WASI/WASM is one portable runtime profile
  under stage1.
  Mention native executables and containers alongside WASI/WASM rather
  than implying WASI/WASM is the central or only binary/runtime target.

## Terminology

- [x] prese.6 Audit slide wording for distributed/decentralized usage.
  Preserve `distributed` for existing supply-chain scale and the
  workshop title. Use `decentralized` for PromiseGrid's target
  coordination model.
- [x] prese.7 Replace or reframe slide uses of `permissions` and most
  `evidence` wording.
  Prefer `capability tokens`, `local resource promises`, `events`, or
  `verifiable records`, depending on the slide context.
