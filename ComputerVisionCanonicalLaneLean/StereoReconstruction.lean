import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure StereoReconstructionPackage where
  cameraCalibration : Prop
  correspondenceMatching : Prop
  triangulation : Prop
  depthMapEstimation : Prop
  occlusionHandling : Prop
  multiViewConsistency : Prop

structure StereoReconstructionEvidence (P : StereoReconstructionPackage) where
  cameraCalibrationClosed : P.cameraCalibration
  correspondenceMatchingClosed : P.correspondenceMatching
  triangulationClosed : P.triangulation
  depthMapEstimationClosed : P.depthMapEstimation
  occlusionHandlingClosed : P.occlusionHandling
  multiViewConsistencyClosed : P.multiViewConsistency

def StereoReconstructionClosed (P : StereoReconstructionPackage) : Prop :=
  P.cameraCalibration ∧ P.correspondenceMatching ∧ P.triangulation ∧
  P.depthMapEstimation ∧ P.occlusionHandling ∧ P.multiViewConsistency

theorem stereo_reconstruction_closed_from_evidence (P : StereoReconstructionPackage) (E : StereoReconstructionEvidence P) : StereoReconstructionClosed P := by
  exact And.intro E.cameraCalibrationClosed
    (And.intro E.correspondenceMatchingClosed
      (And.intro E.triangulationClosed
        (And.intro E.depthMapEstimationClosed
          (And.intro E.occlusionHandlingClosed E.multiViewConsistencyClosed))))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse
