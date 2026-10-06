# Modes and GCAO

## GCAO compatibility

GCAO means:

**Goal → Contexts → Actions → Outputs**

It preserves the full semantic architecture.

| GCAO | Semantic content |
| --- | --- |
| Goal | Role + Goal |
| Contexts | Context + current/expected behavior + inputs/references + constraints |
| Actions | Investigation + preflight + implementation/audit + verification |
| Outputs | Engineering report + success criteria / Definition of Done |

## Correction mode

Use when previous work is incorrect, incomplete, regressed, or does not match the intended reference.

Build a delta-oriented correction with:

- original intended outcome,
- observed mismatch,
- evidence,
- requirement-to-gap comparison,
- repository preflight,
- minimal correction,
- regression checks,
- concise report.

Suggested gap labels:

- correct / keep
- missing / add
- incorrect / fix
- uncertain / inspect

Do not restart the original feature unless necessary.

## Engineering report continuation

When a previous Claude report is supplied:

- treat completed work as reported claims,
- verify relevant claims against the repository,
- retain correct work,
- continue only remaining/incorrect items,
- distinguish fresh verification from old claims.

A useful handoff table is:

| Work item | Reported status/evidence | Repository verification needed | Next action |
| --- | --- | --- | --- |
