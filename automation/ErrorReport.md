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

## 2026-10-12T15:06:04.3595683-04:00 - superseded dependency route

The user rejected both the TwoCommuting dependency and local adaptation of its proofs.
The previous verification establishes only the old route. A new source-directed proof
using Mathlib alone is required; the existing main theorem still imports the forbidden package.

## 2026-10-12T16:28:22.897269-04:00 - supported inverse comparison

Section 1, order: the new proof implements the Hilbert-Schmidt inverse-order step
using supported Sylvester solutions and a positive quadratic identity. This avoids
the epsilon-limit passage while retaining the source inequality and support hypothesis.
This is a local justification of the supplied argument, using only Mathlib.

## 2026-10-12T19:53:45.445129-04:00 - authorized local adaptation verified

The latest user instruction supersedes the earlier prohibition on adapting
lean-twocommuting. The needed proofs now reside in the single local Lean file;
Mathlib is its only import and the only direct Lake dependency. The full build
and transitive audits establish both source targets without extra axioms or
unfinished proofs. The Gaussian regularization/counting route changes auxiliary
constants but preserves the exact principal-value and unique-extension claims.
There is no remaining mathematical gap for these targets. The earlier 1000-line
presentation target remains unmet: the self-contained file has 9950 lines.

## 2026-10-12T20:45:00.111246-04:00 - streamlined source-coordinate proof

The new TriangularHT.lean proof follows the source matrix/heat/Gaussian route,
using finite lattice matrices, positive regularization, and Gaussian averaging
of the center plane. The averaged variance is (63/20)s rather than 3s; the
explicit kernel primitive absorbs this into the unspecified positive constant.
The target Schwartz principal value and unique bounded L3 extension are unchanged.

The new fixed-interval dissipation argument avoids output-dependent intervals,
masks, counting estimates, and the previous bilinear duality argument. Lattice
sampling is performed directly in (x,y,z), then continuous compact cutoffs give
the Schwartz estimate. The preserved old file supplies foundational reference
proofs; it is neither imported nor modified. The new file imports only Mathlib.

Final verification (2026-10-12T20:50:37.805207-04:00) passed the full build and all seven
transitive axiom audits, including both requested main targets. No unresolved
proof gap or target-statement discrepancy remains.
