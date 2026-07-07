# PromiseGrid Presentation Working Repo

This repository contains working drafts and research material for a FAB26 show
and tell on democratized, decentralized, and distributed manufacturing, with a
focus on Community Systems Working Group and PromiseGrid.

## Purpose

This repo is the working layer behind two outward-facing artifacts:

- `whitepaper_draft.md` as the primary external-facing document
- `presentation_draft.txt` as the accompanying slide-story structure

The README keeps the more internal context out of the white paper itself:
research basis, repo notes, working assumptions, and demo-development notes.

## Current Files

- `whitepaper_draft.md`: cleaner external-audience draft
- `presentation_draft.txt`: slide narrative draft
- `wire-lab-main/`: local clone of `promisegrid/wire-lab` `main`

## Working Interpretation

The older top-level PromiseGrid README is useful for broad framing, but the
current working understanding for this presentation comes mainly from the more
recent activity in `promisegrid/wire-lab` `main`, which is now treated here as
the current source of truth.

## What Changed Our Framing

The white paper originally leaned more heavily on the older PromiseGrid README.
After reviewing `wire-lab`, the framing changed in a few important ways:

- PromiseGrid now reads less like a generalized decentralized-computing claim
  and more like an infrastructure prototyping effort for coordination,
  workflows, trust, storage, and collaboration.
- The most compelling manufacturing-relevant evidence is in recent proof of
  concept work, not only in philosophical or architectural descriptions.
- The manufacturing story is stronger when centered on workflows, device
  participation, and shared coordination rather than abstract decentralization
  alone.

## Most Relevant PromiseGrid Work Reviewed

### Production workflow line

- `implementations/poc12-production-progress/README.md`
- `implementations/poc13-cas-compute-functions/README.md`
- `implementations/poc13-cas-compute-functions/docs/RUN-NARRATIVE.md`
- `implementations/poc13-cas-compute-functions/docs/PRODUCTION-FITNESS.md`

Why it matters:

- These materials show PromiseGrid being tested against concrete workflow
  handoffs, device interactions, accounting steps, storage, compute, evidence,
  and trust boundaries.

### Constrained-device line

- `implementations/poc17-m4-lora-runtime/README.md`
- `implementations/poc17-m4-lora-runtime/CHANGELOG.md`

Why it matters:

- This line starts bringing PromiseGrid into low-resource and edge-device
  contexts that feel relevant to workshops, fablabs, and distributed field
  environments.

### Collaboration substrate line

- `docs/research/DN-rifir-poc18-versioned-reference-sets.md`
- `docs/research/DN-dopod-poc18-tangled-prior-art.md`
- `docs/thought-experiments/TE-vahoj-poc18-superset-architecture.md`
- `implementations/poc18-cas-git-replacement/docs/protocols/version-control.md`

Why it matters:

- This appears to be the longer-term knowledge-sharing and collaboration
  substrate direction: sparse CAS, versioned reference sets, and Git as a
  bridge rather than the native center.
- As of the 2026-07-07 update, this line is materially more concrete:
  POC18 now includes continuous peer DAG sync, TCP-based inter-agent exchange,
  storage payment tokens, retention promises, retrieval capability flow,
  Dockerized peer interaction, and a real Git bridge path.

## External White Paper Cleanup Rules

The current `whitepaper_draft.md` is intentionally cleaner than the earlier
version. As a rule, these items should stay in the README and out of the public
white paper unless they become important for the audience:

- branch disputes and branch-status caveats
- repo names used as authority arguments
- detailed POC numbering and internal naming conventions
- implementation verification caveats
- internal source-tracing and provenance notes
- working-production notes for the deck or demo build process

The white paper can still mention recent prototype directions, but it should do
so in audience-facing language first.

## Demo Development Notes

The strongest manufacturing-facing demo candidates right now are:

1. Distributed machine booking with conflict resolution
2. Maintenance stewardship workflow
3. Shared inventory reservation across sites
4. Distributed work-order handoff with device and accounting steps
5. Constrained-device status update over a limited link

The main principle:

- Show coordination and trust becoming visible, not just another software UI.

## Verification Notes

We attempted to run targeted Go tests in the most relevant PromiseGrid proof of
concept directories, but local verification in this environment was blocked by:

- restricted network access for Go module downloads
- local Go toolchain version mismatch

That means the current presentation framing is based on local source review,
recent commit history, and project documentation rather than completed runtime
verification.

## Primary External Sources

- CSWG: <https://cswg.infrastructures.org/>
- PromiseGrid repo: <https://github.com/promisegrid/promisegrid>
- PromiseGrid wire-lab: <https://github.com/promisegrid/wire-lab>
