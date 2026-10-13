# New streamlined formalization: TriangularHT.lean

status | timestamp | exact source location | brief mathematical step
--- | --- | --- | ---
complete | 2026-10-12 20:50:37 ET | Theorem 1, thm | New principal-value bound
complete | 2026-10-12 20:50:37 ET | Theorem 1, line 28 | New unique bounded L3 extension

# New proof work

status | timestamp | exact source location | brief mathematical step
--- | --- | --- | ---
complete | 2026-10-12 20:50:37 ET | Section 1, hess/order/tracelemma | Minimal matrix foundation and cyclic trace estimate
complete | 2026-10-12 20:50:37 ET | Section 2, heat/absorb | Gaussian identities and neighboring energy comparison
complete | 2026-10-12 20:50:37 ET | Section 2, diss/energy | Direct fixed-interval integrated energy bound
complete | 2026-10-12 20:50:37 ET | Section 3, major/tau | Fixed-interval Gaussian form estimate without counting machinery
complete | 2026-10-12 20:50:37 ET | Section 3, dist | Principal-value limit and L3 estimate
complete | 2026-10-12 20:50:37 ET | Theorem 1, line 28 | Bounded extension and uniqueness

Final verification: 2026-10-12T20:50:37.805207-04:00.
`lake build` passed all 9022 jobs with no warnings. Both main targets, truncation
integrability, and the matrix/heat/Gaussian bounds have only `propext`,
`Classical.choice`, and `Quot.sound` in their transitive axiom sets.

TriangularHT.lean has 8672 lines versus 9950 in the preserved old file, including
862 blank lines. Every line is at most 100 characters; all docstrings occupy
one line. Only Mathlib is imported. No placeholders, new axioms, diagnostic
commands, or external repository attribution comments occur in the new file.
The old file was preserved, and Triangular.lean imports the new proof.

# Preserved old formalization

# Main theorem statements

status | timestamp | exact source location | brief mathematical step
--- | --- | --- | ---
complete | 2026-10-12 19:53:45 ET | Theorem 1, thm | Mathlib-only Schwartz principal-value bound
complete | 2026-10-12 19:53:45 ET | Theorem 1, line 28 | Unique bounded complex trilinear L3 extension

# Proof work

status | timestamp | exact source location | brief mathematical step
--- | --- | --- | ---
complete | 2026-10-12 19:53:45 ET | Section 1, hess | Regularized matrix first variation and Hessian
complete | 2026-10-12 19:53:45 ET | Section 1, order | Variational matrix cost and order comparison
complete | 2026-10-12 19:53:45 ET | Section 1, matrixstep | Three-block matrix comparison
complete | 2026-10-12 19:53:45 ET | Section 1, tracelemma | Cyclic trace estimate with factor 5/3
complete | 2026-10-12 19:53:45 ET | Section 2, heat | Finite Gaussian matrix heat identities
complete | 2026-10-12 19:53:45 ET | Section 2, absorb | Neighboring energy absorption with factor sqrt(2)
complete | 2026-10-12 19:53:45 ET | Section 2, diss | Regularized smeared-plane dissipation sufficient for the bound
complete | 2026-10-12 19:53:45 ET | Section 2, energy | Uniform integrated Gaussian energy estimate
complete | 2026-10-12 19:53:45 ET | Section 3, major | Broadened Gaussian derivative domination
complete | 2026-10-12 19:53:45 ET | Section 3, tau | Uniform scale-truncation bound via local counting estimate
complete | 2026-10-12 19:53:45 ET | Section 3, conv | Differentiated Gaussian convolution
complete | 2026-10-12 19:53:45 ET | Section 3, dist | Explicit primitive and principal-value limit
complete | 2026-10-12 19:53:45 ET | Section 3, line 200 | L3 density and Schwartz norm bound
complete | 2026-10-12 19:53:45 ET | Theorem 1, line 28 | Complex trilinearity, bounded extension, and uniqueness
