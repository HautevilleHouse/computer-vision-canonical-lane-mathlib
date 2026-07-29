import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure FeatureDescriptor where
  keypoint : ℝ × ℝ
  scale : ℝ
  orientation : ℝ
  descriptorVector : Vector ℝ 128

structure MatchingCriteria where
  distanceThreshold : ℝ
  ratioTestThreshold : ℝ
  symmetryCheck : Bool

structure FeatureMatchingPackage where
  descriptors1 : List FeatureDescriptor
  descriptors2 : List FeatureDescriptor
  criteria : MatchingCriteria
  rawMatches : List (FeatureDescriptor × FeatureDescriptor)

structure FeatureMatchingEvidence (F : FeatureMatchingPackage) where
  descriptorCountPositive : F.descriptors1.length > 0 ∧ F.descriptors2.length > 0
  thresholdPositive : F.criteria.distanceThreshold > 0 ∧ F.criteria.ratioTestThreshold > 0
  matchesWithinThreshold : ∀ (m : F.rawMatches),
    dist m.1.descriptorVector m.2.descriptorVector ≤ F.criteria.distanceThreshold
  ratioTestPassed : ∀ (m : F.rawMatches),
    dist m.1.descriptorVector m.2.descriptorVector / (minDist m.1 F.descriptors2) ≤ F.criteria.ratioTestThreshold

def FeatureMatchingClosed (F : FeatureMatchingPackage) : Prop :=
  (F.descriptors1.length > 0 ∧ F.descriptors2.length > 0) ∧
  (F.criteria.distanceThreshold > 0 ∧ F.criteria.ratioTestThreshold > 0) ∧
  (∀ (m : F.rawMatches), dist m.1.descriptorVector m.2.descriptorVector ≤ F.criteria.distanceThreshold) ∧
  (∀ (m : F.rawMatches), dist m.1.descriptorVector m.2.descriptorVector / (minDist m.1 F.descriptors2) ≤ F.criteria.ratioTestThreshold)

theorem feature_matching_closed_from_evidence (F : FeatureMatchingPackage) (E : FeatureMatchingEvidence F) : FeatureMatchingClosed F := by
  exact And.intro E.descriptorCountPositive (And.intro E.thresholdPositive (And.intro E.matchesWithinThreshold E.ratioTestPassed))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse