import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure DeepLearningVisionPackage where
  convolutionalArchitecture : Prop
  activationFunctions : Prop
  backpropagationTraining : Prop
  regularizationMethod : Prop
  dataAugmentation : Prop
  transferLearning : Prop

structure DeepLearningVisionEvidence (P : DeepLearningVisionPackage) where
  convolutionalArchitectureClosed : P.convolutionalArchitecture
  activationFunctionsClosed : P.activationFunctions
  backpropagationTrainingClosed : P.backpropagationTraining
  regularizationMethodClosed : P.regularizationMethod
  dataAugmentationClosed : P.dataAugmentation
  transferLearningClosed : P.transferLearning

def DeepLearningVisionClosed (P : DeepLearningVisionPackage) : Prop :=
  P.convolutionalArchitecture ∧ P.activationFunctions ∧ P.backpropagationTraining ∧
  P.regularizationMethod ∧ P.dataAugmentation ∧ P.transferLearning

theorem deep_learning_vision_closed_from_evidence (P : DeepLearningVisionPackage) (E : DeepLearningVisionEvidence P) : DeepLearningVisionClosed P := by
  exact And.intro E.convolutionalArchitectureClosed
    (And.intro E.activationFunctionsClosed
      (And.intro E.backpropagationTrainingClosed
        (And.intro E.regularizationMethodClosed
          (And.intro E.dataAugmentationClosed E.transferLearningClosed))))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse
