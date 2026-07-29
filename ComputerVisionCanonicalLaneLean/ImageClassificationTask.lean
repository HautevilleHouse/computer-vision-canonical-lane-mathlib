import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure ImageClassificationPackage where
  imageWidth : Nat
  imageHeight : Nat
  numClasses : Nat
  modelAccuracy : ℝ
  top5Accuracy : ℝ

structure ImageClassificationEvidence (C : ImageClassificationPackage) where
  imageWidthClosed : C.imageWidth > 0
  imageHeightClosed : C.imageHeight > 0
  numClassesClosed : C.numClasses > 0
  modelAccuracyClosed : C.modelAccuracy ≥ 0
  top5AccuracyClosed : C.top5Accuracy ≥ 0

def ImageClassificationClosed (C : ImageClassificationPackage) : Prop :=
  (C.imageWidth > 0) ∧ (C.imageHeight > 0) ∧ (C.numClasses > 0) ∧ (C.modelAccuracy ≥ 0) ∧ (C.top5Accuracy ≥ 0)

theorem image_classification_closed_from_evidence (C : ImageClassificationPackage)
    (E : ImageClassificationEvidence C) : ImageClassificationClosed C := by
  exact And.intro E.imageWidthClosed
    (And.intro E.imageHeightClosed
      (And.intro E.numClassesClosed
        (And.intro E.modelAccuracyClosed E.top5AccuracyClosed)))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse