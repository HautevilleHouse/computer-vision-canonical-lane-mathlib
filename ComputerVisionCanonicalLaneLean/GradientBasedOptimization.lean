import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure GradientOptimizationPackage where
  learningRate : ℝ
  momentum : ℝ
  weightDecay : ℝ
  lossFunction : Type
  optimizerStep : ℕ → ℝ → ℝ

structure GradientOptimizationEvidence (O : GradientOptimizationPackage) where
  learningRateClosed : O.learningRate > 0
  momentumClosed : O.momentum ≥ 0
  weightDecayClosed : O.weightDecay ≥ 0
  lossFunctionClosed : Nonempty O.lossFunction
  optimizerStepClosed : ∀ (t : ℕ) (x : ℝ), O.optimizerStep t x = x - O.learningRate * (O.weightDecay * x + (O.lossFunction := ?_) ) 

def GradientOptimizationClosed (O : GradientOptimizationPackage) : Prop :=
  (O.learningRate > 0) ∧ (O.momentum ≥ 0) ∧ (O.weightDecay ≥ 0) ∧ Nonempty O.lossFunction

theorem gradient_optimization_closed_from_evidence (O : GradientOptimizationPackage)
    (E : GradientOptimizationEvidence O) : GradientOptimizationClosed O := by
  exact And.intro E.learningRateClosed (And.intro E.momentumClosed (And.intro E.weightDecayClosed E.lossFunctionClosed))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse