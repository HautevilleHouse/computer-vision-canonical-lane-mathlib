import HautevilleHouse.ComputerVisionCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ComputerVisionCanonicalLaneLean
end HautevilleHouse