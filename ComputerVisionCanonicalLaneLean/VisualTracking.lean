import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure VisualTrackingPackage where
  appearanceModel : Prop
  motionModel : Prop
  stateEstimation : Prop
  occlusionHandling : Prop
  multiTargetAssociation : Prop

structure VisualTrackingEvidence (P : VisualTrackingPackage) where
  appearanceModelClosed : P.appearanceModel
  motionModelClosed : P.motionModel
  stateEstimationClosed : P.stateEstimation
  occlusionHandlingClosed : P.occlusionHandling
  multiTargetAssociationClosed : P.multiTargetAssociation

def VisualTrackingClosed (P : VisualTrackingPackage) : Prop :=
  P.appearanceModel ∧ P.motionModel ∧ P.stateEstimation ∧
  P.occlusionHandling ∧ P.multiTargetAssociation

theorem visual_tracking_closed_from_evidence (P : VisualTrackingPackage) (E : VisualTrackingEvidence P) : VisualTrackingClosed P := by
  exact And.intro E.appearanceModelClosed
    (And.intro E.motionModelClosed
      (And.intro E.stateEstimationClosed
        (And.intro E.occlusionHandlingClosed E.multiTargetAssociationClosed)))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse
