import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure BoundingBox where
  center : ℝ × ℝ
  size : ℝ × ℝ
  confidence : ℝ

structure DetectionResult where
  boxes : List BoundingBox
  classIds : List ℕ
  scores : List ℝ

structure ObjectDetectionPackage where
  detectionResult : DetectionResult
  iouThreshold : ℝ
  confidenceThreshold : ℝ
  nmsApplied : Bool

structure ObjectDetectionEvidence (D : ObjectDetectionPackage) where
  thresholdsValid : D.iouThreshold > 0 ∧ D.iouThreshold ≤ 1 ∧ D.confidenceThreshold > 0 ∧ D.confidenceThreshold ≤ 1
  confidenceFiltered : ∀ (s : D.detectionResult.scores), s ≥ D.confidenceThreshold
  nmsAppliedCheck : D.nmsApplied = true
  boxCountMatch : D.detectionResult.boxes.length = D.detectionResult.classIds.length ∧
    D.detectionResult.boxes.length = D.detectionResult.scores.length

def ObjectDetectionClosed (D : ObjectDetectionPackage) : Prop :=
  (D.iouThreshold > 0 ∧ D.iouThreshold ≤ 1 ∧ D.confidenceThreshold > 0 ∧ D.confidenceThreshold ≤ 1) ∧
  (∀ (s : D.detectionResult.scores), s ≥ D.confidenceThreshold) ∧
  D.nmsApplied = true ∧
  (D.detectionResult.boxes.length = D.detectionResult.classIds.length ∧ D.detectionResult.boxes.length = D.detectionResult.scores.length)

theorem object_detection_closed_from_evidence (D : ObjectDetectionPackage) (E : ObjectDetectionEvidence D) : ObjectDetectionClosed D := by
  exact And.intro E.thresholdsValid (And.intro E.confidenceFiltered (And.intro E.nmsAppliedCheck E.boxCountMatch))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse