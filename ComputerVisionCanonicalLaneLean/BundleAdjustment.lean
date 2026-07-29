import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure Observation where
  pointIndex : ℕ
  cameraIndex : ℕ
  imagePoint : ℝ × ℝ

structure CameraPose where
  rotation : Matrix ℝ 3 3
  translation : Vector ℝ 3

structure Point3D where
  coordinates : ℝ³

structure BundleAdjustmentPackage where
  cameras : List CameraPose
  points3D : List Point3D
  observations : List Observation
  residualThreshold : ℝ
  finalCost : ℝ
  iterations : ℕ

structure BundleAdjustmentEvidence (B : BundleAdjustmentPackage) where
  cameraCountPositive : B.cameras.length > 0
  pointCountPositive : B.points3D.length > 0
  observationsMatch : B.observations.length ≥ (B.cameras.length * B.points3D.length) / 2
  rotationValid : ∀ (c : B.cameras), c.rotation.det = 1 ∧ c.rotation *ᵀ c.rotation = 1
  costUnderThreshold : B.finalCost < B.residualThreshold
  iterationsSufficient : B.iterations ≥ 10

def BundleAdjustmentClosed (B : BundleAdjustmentPackage) : Prop :=
  B.cameras.length > 0 ∧
  B.points3D.length > 0 ∧
  B.observations.length ≥ (B.cameras.length * B.points3D.length) / 2 ∧
  (∀ (c : B.cameras), c.rotation.det = 1 ∧ c.rotation *ᵀ c.rotation = 1) ∧
  B.finalCost < B.residualThreshold ∧
  B.iterations ≥ 10

theorem bundle_adjustment_closed_from_evidence (B : BundleAdjustmentPackage) (E : BundleAdjustmentEvidence B) : BundleAdjustmentClosed B := by
  exact And.intro E.cameraCountPositive (And.intro E.pointCountPositive (And.intro E.observationsMatch (And.intro E.rotationValid (And.intro E.costUnderThreshold E.iterationsSufficient))))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse