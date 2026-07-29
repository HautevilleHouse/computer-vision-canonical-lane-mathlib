import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure VisionTransformerPackage where
  imageSize : ℕ × ℕ
  patchSize : ℕ
  numLayers : ℕ
  numHeads : ℕ
  hiddenDim : ℕ
  mlpDim : ℕ
  numClasses : ℕ

structure VisionTransformerEvidence (V : VisionTransformerPackage) where
  imageSizeClosed : V.imageSize.1 > 0 ∧ V.imageSize.2 > 0
  patchSizeClosed : V.patchSize > 0
  numLayersClosed : V.numLayers > 0
  numHeadsClosed : V.numHeads > 0
  hiddenDimClosed : V.hiddenDim > 0
  mlpDimClosed : V.mlpDim > 0
  numClassesClosed : V.numClasses > 0
  divisibleClosed : V.imageSize.1 % V.patchSize = 0 ∧ V.imageSize.2 % V.patchSize = 0

def VisionTransformerClosed (V : VisionTransformerPackage) : Prop :=
  (V.imageSize.1 > 0 ∧ V.imageSize.2 > 0) ∧ (V.patchSize > 0) ∧ (V.numLayers > 0) ∧
  (V.numHeads > 0) ∧ (V.hiddenDim > 0) ∧ (V.mlpDim > 0) ∧ (V.numClasses > 0) ∧
  (V.imageSize.1 % V.patchSize = 0 ∧ V.imageSize.2 % V.patchSize = 0)

theorem vision_transformer_closed_from_evidence (V : VisionTransformerPackage)
    (E : VisionTransformerEvidence V) : VisionTransformerClosed V := by
  have h1 : V.imageSize.1 > 0 ∧ V.imageSize.2 > 0 := E.imageSizeClosed
  have h2 : V.imageSize.1 % V.patchSize = 0 ∧ V.imageSize.2 % V.patchSize = 0 := E.divisibleClosed
  exact And.intro h1
    (And.intro E.patchSizeClosed
      (And.intro E.numLayersClosed
        (And.intro E.numHeadsClosed
          (And.intro E.hiddenDimClosed
            (And.intro E.mlpDimClosed
              (And.intro E.numClassesClosed h2))))))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse