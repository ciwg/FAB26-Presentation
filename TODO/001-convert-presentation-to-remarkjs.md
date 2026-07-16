## Decision Intent Log

ID: DI-001-20260709-154911
Date: 2026-07-09 15:49:11
Status: active
Decision: Convert `presentation_draft.txt` into a single remark.js-compatible Markdown deck at `slides.md`.
Intent: Preserve the approved 12-slide presentation narrative while making it directly usable as a remark.js source deck with visible slide copy and presenter notes.
Constraints: Keep `presentation_draft.txt` unchanged; create only `slides.md` plus required TODO tracking files; use manual Markdown editing; keep existing slide titles; do not add scripts, functions, variables, generated state, extra assets, CSS, or HTML shell files.
Affects: `TODO/`, `TODO/TODO.md`, `TODO/001-convert-presentation-to-remarkjs.md`, `presentation_draft.txt`, `slides.md`

## Locked Decisions

- DEC-001 Architecture: Create a single Markdown deck only; do not add an HTML shell, CSS, assets, scripts, or generated state.
- DEC-002 Behavior: Use the 12-slide draft with visible copy on slides and talk tracks/source notes in remark presenter notes.
- DEC-003 Implementation: Manually create `slides.md` from the approved source draft.
- DEC-004 Naming: Keep existing slide titles exactly and add no code functions or variables.
- DEC-005 Paths: Create `TODO/`, `TODO/TODO.md`, `TODO/001-convert-presentation-to-remarkjs.md`, and `slides.md`; read `presentation_draft.txt`; leave `presentation_draft.txt` unchanged.

# TODO 001 - Convert Presentation Draft To Remark.js Slides

- [x] 001.1 Record locked decisions in this Decision Intent Log.
- [x] 001.2 Create `slides.md` as the single remark.js deck artifact.
- [x] 001.3 Preserve the approved 12-slide structure from `presentation_draft.txt`.
- [x] 001.4 Move talk tracks and source notes into remark presenter notes.
- [x] 001.5 Verify slide count, title coverage, path compliance, and source preservation.
