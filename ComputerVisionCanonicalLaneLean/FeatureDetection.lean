import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure FeatureDetectionPackage where
  cornerDetector : Prop
  blobDetector : Prop
  edgeDetector : Prop
  scaleInvariant : Prop
  rotationInvariant : Prop
  illuminationInvariant : Prop

structure FeatureDetectionEvidence (P : FeatureDetectionPackage) where
  cornerDetectorClosed : P.cornerDetector
  blobDetectorClosed : P.blobDetector
  edgeDetectorClosed : P.edgeDetector
  scaleInvariantClosed : P.scaleInvariant
  rotationInvariantClosed : P.rotationInvariant
  illuminationInvariantClosed : P.illuminationInvariant

def FeatureDetectionClosed (P : FeatureDetectionPackage) : Prop :=
  P.cornerDetector ∧ P.blobDetector ∧ P.edgeDetector ∧
  P.scaleInvariant ∧ P.rotationInvariant ∧ P.illuminationInvariant

theorem feature_detection_closed_from_evidence (P : FeatureDetectionPackage) (E : FeatureDetectionEvidence P) : FeatureDetectionClosed P := by
  exact And.intro E.cornerDetectorClosed
    (And.intro E.blobDetectorClosed
      (And.intro E.edgeDetectorClosed
        (And.intro E.scaleInvariantClosed
          (And.intro E.rotationInvariantClosed E.illuminationInvariantClosed))))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse
