import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure SemanticSegmentationPackage where
  encoderDepth : ℕ
  decoderDepth : ℕ
  inputChannels : ℕ
  numClasses : ℕ
  upsamplingMethod : String

structure SemanticSegmentationEvidence (S : SemanticSegmentationPackage) where
  encoderDepthClosed : S.encoderDepth ≥ 3
  decoderDepthClosed : S.decoderDepth ≥ 1
  inputChannelsClosed : S.inputChannels = 3
  numClassesClosed : S.numClasses > 0
  upsamplingMethodClosed : S.upsamplingMethod ∈ {"bilinear", "nearest", "transposed_conv"}

def SemanticSegmentationClosed (S : SemanticSegmentationPackage) : Prop :=
  (S.encoderDepth ≥ 3) ∧ (S.decoderDepth ≥ 1) ∧ (S.inputChannels = 3) ∧
  (S.numClasses > 0) ∧ (S.upsamplingMethod ∈ {"bilinear", "nearest", "transposed_conv"})

theorem semantic_segmentation_closed_from_evidence (S : SemanticSegmentationPackage)
    (E : SemanticSegmentationEvidence S) : SemanticSegmentationClosed S := by
  exact And.intro E.encoderDepthClosed
    (And.intro E.decoderDepthClosed
      (And.intro E.inputChannelsClosed
        (And.intro E.numClassesClosed E.upsamplingMethodClosed)))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse