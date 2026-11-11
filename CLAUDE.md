# Claude instructions

Follow `AGENTS.md` (it points to the automation instructions and status files).

## Commits

- Subject: `[claude] <lowercase descriptive subject>`, matching the `[codex] ...` style in `git log`.
- Then a blank line and the `Co-Authored-By` trailer. No body.
- Commit or push only when asked.

## Lean

- Mathlib is cached; never rebuild it. Check a file with `lake env lean <file>`, build with `lake build`.
- Leave no `sorry`, diagnostic commands, or warnings in source.
