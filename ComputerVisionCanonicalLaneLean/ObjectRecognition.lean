import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure ObjectRecognitionPackage where
  featureExtraction : Prop
  classifierTraining : Prop
  objectLocalization : Prop
  multiClassDiscrimination : Prop
  viewpointInvariance : Prop

structure ObjectRecognitionEvidence (P : ObjectRecognitionPackage) where
  featureExtractionClosed : P.featureExtraction
  classifierTrainingClosed : P.classifierTraining
  objectLocalizationClosed : P.objectLocalization
  multiClassDiscriminationClosed : P.multiClassDiscrimination
  viewpointInvarianceClosed : P.viewpointInvariance

def ObjectRecognitionClosed (P : ObjectRecognitionPackage) : Prop :=
  P.featureExtraction ∧ P.classifierTraining ∧ P.objectLocalization ∧
  P.multiClassDiscrimination ∧ P.viewpointInvariance

theorem object_recognition_closed_from_evidence (P : ObjectRecognitionPackage) (E : ObjectRecognitionEvidence P) : ObjectRecognitionClosed P := by
  exact And.intro E.featureExtractionClosed
    (And.intro E.classifierTrainingClosed
      (And.intro E.objectLocalizationClosed
        (And.intro E.multiClassDiscriminationClosed E.viewpointInvarianceClosed)))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse
