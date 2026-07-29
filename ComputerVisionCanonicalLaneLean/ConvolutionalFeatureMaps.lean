import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure FeatureMapPackage where
  inputChannels : Nat
  outputChannels : Nat
  kernelSize : Nat
  strides : Nat
  padding : Nat
  activation : String

structure FeatureMapEvidence (F : FeatureMapPackage) where
  inputChannelsClosed : F.inputChannels = 3
  outputChannelsClosed : F.outputChannels > 0
  kernelSizeClosed : F.kernelSize % 2 = 1
  stridesClosed : F.strides = 1
  paddingClosed : F.padding = (F.kernelSize - 1) / 2
  activationClosed : F.activation = "ReLU"

def FeatureMapClosed (F : FeatureMapPackage) : Prop :=
  (F.inputChannels = 3) ∧ (F.outputChannels > 0) ∧ (F.kernelSize % 2 = 1) ∧
  (F.strides = 1) ∧ (F.padding = (F.kernelSize - 1) / 2) ∧ (F.activation = "ReLU")

theorem feature_map_closed_from_evidence (F : FeatureMapPackage) (E : FeatureMapEvidence F) :
    FeatureMapClosed F := by
  exact And.intro E.inputChannelsClosed
    (And.intro E.outputChannelsClosed
      (And.intro E.kernelSizeClosed
        (And.intro E.stridesClosed
          (And.intro E.paddingClosed E.activationClosed))))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse