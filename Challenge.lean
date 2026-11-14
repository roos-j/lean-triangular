/-
Copyright (c) 2026 Joris Roos. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
This file was assembled by Claude from the human-written files `Triangular/Defs.lean`, `Triangular/Theorems.lean`.
-/
module

public import Mathlib.Analysis.Fourier.AddCircle
public import Mathlib.MeasureTheory.Integral.Bochner.Basic
public import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
public import Mathlib.Analysis.Distribution.SchwartzSpace.Basic
public import Mathlib.MeasureTheory.Function.LpSeminorm.Defs

/-!
# Challenge file for Comparator
-/

@[expose] public noncomputable section

namespace Triangular

open Topology Filter

/-- Truncated triangular Hilbert transform as a trilinear form -/
def T_trunc (F₀ F₁ F₂ : ℝ × ℝ → ℂ) (ε : ℝ) : ℂ :=
  ∫ p in {((x, y), z) : (ℝ × ℝ) × ℝ | ε < |x + y + z|},
    let ((x, y), z) := p
    F₀ (x, y) * F₁ (y, z) * F₂ (z, x) / (x + y + z : ℝ)

/-- Triangular Hilbert transform as a trilinear form, defined as the principal value of `T_trunc`.

**Note:** That the principal value limit exists for Schwartz functions is
the content of `Auto.tendsto_T_trunc`. -/
def T (F₀ F₁ F₂ : ℝ × ℝ → ℂ) : ℂ := limUnder (𝓝[>] 0) (T_trunc F₀ F₁ F₂)

/-- The partial sums of the Fourier series of a 1-periodic function. -/
def fourierPartialSum (f : ℝ → ℂ) (N : ℕ) (x : ℝ) : ℂ :=
  ∑ n ∈ Finset.Icc (-(N : ℤ)) N, fourierCoeffOn zero_lt_one f n * fourier n (x : UnitAddCircle)

end Triangular

end

public section

namespace Triangular

open MeasureTheory SchwartzMap Topology Filter Function

/-- The triangular Hilbert transform is bounded on `L³ × L³ × L³`.
-/
theorem triangular_ht_bound :
    ∃ C : ℝ, ∀ F₀ F₁ F₂ : 𝓢(ℝ × ℝ, ℂ),
      ‖T F₀ F₁ F₂‖ₑ ≤ ENNReal.ofReal C * eLpNorm F₀ 3 * eLpNorm F₁ 3 * eLpNorm F₂ 3 :=
  sorry

/-- **Carleson's theorem** for continuous functions. The Fourier series of a continuous
1-periodic function converges pointwise almost everywhere. -/
theorem classical_carleson (f : ℝ → ℂ) (hf : Continuous f) (hper : Periodic f 1) :
    ∀ᵐ x, Tendsto (fun N ↦ fourierPartialSum f N x) atTop (𝓝 (f x)) :=
  sorry

end Triangular

end
