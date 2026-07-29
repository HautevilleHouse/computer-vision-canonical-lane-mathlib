import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure StereoCameraSetup where
  baseline : ℝ
  focalLength : ℝ
  principalPointLeft : ℝ × ℝ
  principalPointRight : ℝ × ℝ

structure DisparityMap where
  disparities : List (ℝ × ℝ × ℝ) -- (x, y, disparity)
  validPointsCount : ℕ
  totalPoints : ℕ
  validityRatio : ℝ

structure StereovisionPackage where
  setup : StereoCameraSetup
  disparityMap : DisparityMap
  reprojectionMatrix : Matrix ℝ 4 4
  depthMap : List (ℝ × ℝ × ℝ) -- (x, y, depth)

structure StereovisionEvidence (S : StereovisionPackage) where
  setupValid : S.setup.baseline > 0 ∧ S.setup.focalLength > 0
  disparityValid : ∀ (d : S.disparityMap.disparities), d.3 ≥ 0
  validityRatioHigh : S.disparityMap.validityRatio ≥ 0.5
  reprojectionCorrect : S.reprojectionMatrix.det ≠ 0
  depthComputed : S.depthMap.length = S.disparityMap.validPointsCount

def StereovisionClosed (S : StereovisionPackage) : Prop :=
  (S.setup.baseline > 0 ∧ S.setup.focalLength > 0) ∧
  (∀ (d : S.disparityMap.disparities), d.3 ≥ 0) ∧
  S.disparityMap.validityRatio ≥ 0.5 ∧
  S.reprojectionMatrix.det ≠ 0 ∧
  S.depthMap.length = S.disparityMap.validPointsCount

theorem stereovision_closed_from_evidence (S : StereovisionPackage) (E : StereovisionEvidence S) : StereovisionClosed S := by
  exact And.intro E.setupValid (And.intro E.disparityValid (And.intro E.validityRatioHigh (And.intro E.reprojectionCorrect E.depthComputed)))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse