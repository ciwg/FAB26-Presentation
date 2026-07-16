## Decision Intent Log

ID: DI-001-20260709-154911
Date: 2026-07-09 15:49:11
Status: active
Decision: Convert `presentation_draft.txt` into a single remark.js-compatible Markdown deck at `slides.md`.
Intent: Preserve the approved 12-slide presentation narrative while making it directly usable as a remark.js source deck with visible slide copy and presenter notes.
Constraints: Keep `presentation_draft.txt` unchanged; create only `slides.md` plus required TODO tracking files; use manual Markdown editing; keep existing slide titles; do not add scripts, functions, variables, generated state, extra assets, CSS, or HTML shell files.
Affects: `TODO/`, `TODO/TODO.md`, `TODO/001-convert-presentation-to-remarkjs.md`, `presentation_draft.txt`, `slides.md`

ID: DI-foval
Date: 2026-07-16 14:54:29
Author: stevegt@t7a.org (Steve Traugott)
Status: active
Decision: Rename the legacy TODO 001 tracking file to `TODO/TODO-haduz-convert-presentation-to-remarkjs.md` and update the local TODO label to `haduz`.
Intent: Move this completed task onto the repo's proquint TODO naming convention while preserving the original slide-conversion decision history.
Constraints: Use `git mv` for the file rename; keep the existing slide and whitepaper artifacts unchanged; preserve the historical `DI-001-20260709-154911` entry as prior provenance.
Affects: `TODO/TODO.md`, `TODO/001-convert-presentation-to-remarkjs.md`, `TODO/TODO-haduz-convert-presentation-to-remarkjs.md`

## Locked Decisions

- DEC-001 Architecture: Create a single Markdown deck only; do not add an HTML shell, CSS, assets, scripts, or generated state.
- DEC-002 Behavior: Use the 12-slide draft with visible copy on slides and talk tracks/source notes in remark presenter notes.
- DEC-003 Implementation: Manually create `slides.md` from the approved source draft.
- DEC-004 Naming: Keep existing slide titles exactly and add no code functions or variables.
- DEC-005 Paths: Create `TODO/`, `TODO/TODO.md`, `TODO/001-convert-presentation-to-remarkjs.md`, and `slides.md`; read `presentation_draft.txt`; leave `presentation_draft.txt` unchanged.

## Migration Locked Decisions

- DEC-haduz-001 Architecture: Keep this as a root `TODO/` record and migrate only the existing completed TODO identity.
- DEC-haduz-002 Behavior: Preserve the completed task status and slide-conversion provenance while changing the visible TODO label to `haduz`.
- DEC-haduz-003 Implementation: Use `git mv` for the path rename and small Markdown edits for local references.
- DEC-haduz-004 Function Naming: No function names are affected by this documentation-only migration.
- DEC-haduz-005 Variable Naming: No variable names are affected by this documentation-only migration.
- DEC-haduz-006 Paths: Rename `TODO/001-convert-presentation-to-remarkjs.md` to `TODO/TODO-haduz-convert-presentation-to-remarkjs.md`, update `TODO/TODO.md`, and leave slides and whitepaper files unchanged.

# TODO haduz - Convert Presentation Draft To Remark.js Slides

- [x] haduz.1 Record locked decisions in this Decision Intent Log.
- [x] haduz.2 Create `slides.md` as the single remark.js deck artifact.
- [x] haduz.3 Preserve the approved 12-slide structure from `presentation_draft.txt`.
- [x] haduz.4 Move talk tracks and source notes into remark presenter notes.
- [x] haduz.5 Verify slide count, title coverage, path compliance, and source preservation.
