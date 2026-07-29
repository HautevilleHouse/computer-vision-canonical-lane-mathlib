import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure ObjectDetectionPackage where
  backbone : String
  neck : String
  head : String
  anchorBoxes : ℕ
  numClasses : ℕ

structure ObjectDetectionEvidence (D : ObjectDetectionPackage) where
  backboneClosed : D.backbone ∈ {"ResNet", "MobileNet", "EfficientNet"}
  neckClosed : D.neck ∈ {"FPN", "PAN", "BiFPN"}
  headClosed : D.head ∈ {"YOLO", "SSD", "RetinaNet"}
  anchorBoxesClosed : D.anchorBoxes > 0
  numClassesClosed : D.numClasses > 0

def ObjectDetectionClosed (D : ObjectDetectionPackage) : Prop :=
  (D.backbone ∈ {"ResNet", "MobileNet", "EfficientNet"}) ∧
  (D.neck ∈ {"FPN", "PAN", "BiFPN"}) ∧
  (D.head ∈ {"YOLO", "SSD", "RetinaNet"}) ∧
  (D.anchorBoxes > 0) ∧ (D.numClasses > 0)

theorem object_detection_closed_from_evidence (D : ObjectDetectionPackage)
    (E : ObjectDetectionEvidence D) : ObjectDetectionClosed D := by
  exact And.intro E.backboneClosed
    (And.intro E.neckClosed
      (And.intro E.headClosed
        (And.intro E.anchorBoxesClosed E.numClassesClosed)))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse