# Formalization of bounds for the triangular Hilbert transform

This is a Lean 4 formalization of an $`L^3\times L^3\to L^{3/2}`$ bound for the triangular Hilbert transform.
It follows a streamlined version of the proof contained in a document [recently made public by OpenAI](https://github.com/openai/math/blob/adc7f1241b42e322a6451854ab7e4b4c146bf78a/preprints/The-maximal-triangular-Hilbert-transform-at-the-symmetric-point-September-24-2026/paper.pdf). 

The main theorems and definitions in `Defs.lean` and `Theorems.lean` were human-written.
The proof was formalized by Codex/GPT-6 Astra Light and Medium. This formalization is independent of OpenAI's formalizations. 

This theorem also gives an alternative proof for Carleson's theorem on the pointwise almost everywhere convergence of Fourier series of continuous periodic functions. The standard reduction was formalized using Claude Code Opus 5.5 Medium.

## Main theorems

The compared statements are in `Triangular/Theorems.lean`, with definitions in `Triangular/Defs.lean`:

- `Triangular.triangular_ht_bound`: the symmetric principal value of the triangular Hilbert form is bounded on $`L^3\times L^3\times L^3`$ (a priori, for Schwartz functions).
- `Triangular.classical_carleson`: the Fourier series of a continuous 1-periodic function converges almost everywhere.

## References

- OpenAI, *The maximal triangular Hilbert transform at the symmetric point*, preprint, September 24, 2026, [PDF](https://github.com/openai/math/blob/adc7f1241b42e322a6451854ab7e4b4c146bf78a/preprints/The-maximal-triangular-Hilbert-transform-at-the-symmetric-point-September-24-2026/paper.pdf). The formalized bound is the scalar consequence (Proposition 7.4) of its Theorem 1.1.
- L. Grafakos, D. Oliveira e Silva, M. Pramanik, A. Seeger, B. Stovall, *Some problems in harmonic analysis*, [arXiv:1701.06637](https://arxiv.org/abs/1701.06637), Section 9 (C. Thiele), Problem 13.
- L. Carleson, *On convergence and growth of partial sums of Fourier series*, Acta Math. **116** (1966), 135-157, [doi:10.1007/BF02392815](https://doi.org/10.1007/BF02392815).
