## Decision Intent Log

ID: DI-dufiv
Date: 2026-07-25 16:56:28
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Track RFC-style white paper revisions in TODO `tikup`.
Intent: Keep the next technical-white-paper tone pass explicit and reviewable before changing headings, requirements wording, or the existing-software section.
Constraints: Do not implement these wording changes in this TODO creation pass; keep future edits minimal and section-local; preserve 74-column wrapping in the white paper.
Affects: `whitepaper_draft.md`, `TODO/TODO.md`, `TODO/TODO-tikup-whitepaper-rfc-style.md`

ID: DI-gijot
Date: 2026-07-25 17:12:03
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Implement the `tikup` RFC-style white paper revisions.
Intent: Make the white paper more definitive and technical by replacing essay-style headings, soft requirement wording, and critique-style existing-software framing.
Constraints: Keep edits local to the tracked white paper sections; do not rewrite unrelated sections; preserve 74-column wrapping.
Affects: `whitepaper_draft.md`, `TODO/TODO-tikup-whitepaper-rfc-style.md`

# TODO tikup - Track RFC-Style White Paper Revisions

- [x] tikup.1 Retitle essay-like headings.
  Change `The Coordination Problem Underneath Production` to `Problem Statement`; change `PromiseGrid as a Response` to `PromiseGrid Architecture`; change `Promise Theory as an Important Foundation` to `Promise Theory`; change `Technical Details in Plain Language` to `Prototype Architecture`.
- [x] tikup.2 Replace soft requirement wording.
  Change `Decentralized manufacturing requires coordination systems that fit smaller budgets, smaller staffs, local authority, and uneven process maturity.` to direct requirements language covering local operation, decentralized coordination, partial trust, offline or transport-independent transfer, auditable commitments, and low administrative overhead.
- [x] tikup.3 Reframe the existing-software section.
  Change `Why Existing Software Infrastructure Falls Short` and the paragraph beginning `Traditional software often implements the center...` into a scale-mismatch section stating that ERP, EDI, MES, QMS, and ISO 9000 systems assume centralized administration, dedicated budget, trained staff, and uniform process maturity.
