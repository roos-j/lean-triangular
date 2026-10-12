# Operative instructions

User prompts are preserved in [raw.md](raw.md), with local recording timestamps.
Formalize Theorem 1 of `blueprint/source.tex`: the Schwartz principal-value bound
and its unique bounded trilinear extension to L3(R2)^3. Keep `source.tex` ignored.
Use namespace `Auto` and `Triangular/Auto/TriangularHilbert.lean`.
Make exactly the two requested commits: initial setup (7a004e2), then completion.
No push was requested. The existing origin configuration is preserved.

The user's later directions requested Git status, explanation and correction of
ownership, then continuation. Ownership of `.git` was set to JR and verified;
no global safe.directory setting was added. These directions did not change scope.
No local scheduled-task facility was available during this effort.

# Source and proof route

Source SHA256: `0899FA62ED8E31F130726DD524B2BE6C5CC2C55F7D11A17AB9B44E337B9D2EE3`.
Lean/Mathlib: `v4.35.0-rc4`, Mathlib commit
`1f414401f69059aa7eead47b53ee40bd38455eeb`; dependencies are locked in the manifest.

The reuse decision recorded 2026-10-12T09:37:21.0167876-04:00 pins
`lean-twocommuting` at `33b69ccacc013c703a151421658187ea4d2029fb`.
Its cyclic trace, Gaussian energy, and finite counting estimates supply prerequisites.
The local proof computes the third-Gaussian primitive, proves cancellation and
absolute integrability for Schwartz inputs, identifies both Gaussian and symmetric
hard-truncation limits, transfers the L3 estimate, and changes to source coordinates.
The variance (63/20)s changes only the unspecified constant; see ErrorReport.md.
Unused stronger intermediate manuscript identities are not separate targets.
The dense-extension helpers are adapted, with attribution, from
`../lean-trilinearht/TrilinearHT/Auto/SecCompletion.lean`; that project is not a dependency.

# Completed targets and verification

Final verification recorded 2026-10-12T10:33:57.1330778-04:00:
`lake build` passed, 9028 jobs. The default `Triangular` library root imports the proof.
No source placeholders or new axioms occur. The main and intermediate axiom audits
report only `propext`, `Classical.choice`, and `Quot.sound`.

- `Auto.triangularHilbert_main`: the explicit source integral has a symmetric
  principal value bounded by one finite constant times the three L3 norms.
- `Auto.triangularHilbertTruncation_integrable`: every positive hard truncation
  is absolutely convergent.
- `Auto.triangularHilbert_unique_extension`: existence, the same norm bound,
  agreement on Schwartz triples, and uniqueness among bounded trilinear forms.

All requested mathematical targets are complete. No further proof step remains.
