# Source discrepancies

## 2026-10-12T09:42:17.8887696-04:00 — prerequisite reuse

The main theorem is the sole source target, including its extension assertion.
The pinned TwoCommuting proof supplies the cyclic trace estimate and a regularized,
Gaussian-averaged center-plane argument. Its continuum and finite counting bounds
use variance (63/20)s; source sections 1–2 use fixed supports and an unsmeared plane.
This is an alternative proof route, not verification of every stronger intermediate
identity or explicit constant printed in source.tex.
At that point, the principal-value bridge and extension were still incomplete.

## 2026-10-12T10:33:57.1330778-04:00 — completed bridge and source fidelity

The local primitive computation identifies the Gaussian limit with a positive,
explicit multiple of the symmetric Hilbert principal value. Schwartz cancellation
justifies the integral limit; the substitution z = -x-y-t preserves volume and
restores exactly F0(x,y)F1(y,z)F2(z,x)/(x+y+z). Both planar input substitutions
preserve L3 norms. The altered Gaussian variance is absorbed into the unspecified
constant, without changing the main theorem's hypotheses or conclusion.

The actual source principal value, its bound, complex trilinearity, and the unique
bounded L3 extension all pass the full build and transitive axiom audit.
No unresolved source discrepancy or proof gap remains for the requested targets.
