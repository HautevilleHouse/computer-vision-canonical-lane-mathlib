import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure OpticalFlowPackage where
  brightnessConstancy : Prop
  smoothnessPrior : Prop
  coarseToFine : Prop
  occlusionModel : Prop
  variationalFormulation : Prop

structure OpticalFlowEvidence (P : OpticalFlowPackage) where
  brightnessConstancyClosed : P.brightnessConstancy
  smoothnessPriorClosed : P.smoothnessPrior
  coarseToFineClosed : P.coarseToFine
  occlusionModelClosed : P.occlusionModel
  variationalFormulationClosed : P.variationalFormulation

def OpticalFlowClosed (P : OpticalFlowPackage) : Prop :=
  P.brightnessConstancy ∧ P.smoothnessPrior ∧ P.coarseToFine ∧
  P.occlusionModel ∧ P.variationalFormulation

theorem optical_flow_closed_from_evidence (P : OpticalFlowPackage) (E : OpticalFlowEvidence P) : OpticalFlowClosed P := by
  exact And.intro E.brightnessConstancyClosed
    (And.intro E.smoothnessPriorClosed
      (And.intro E.coarseToFineClosed
        (And.intro E.occlusionModelClosed E.variationalFormulationClosed)))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse
