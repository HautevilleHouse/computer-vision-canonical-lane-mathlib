import CanonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ComputerVisionCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.ComputerVisionCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

def ConstrainedComputerVisionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_computer_vision_endgame (A : AdmissibleClass) :
    ConstrainedComputerVisionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ComputerVisionCanonicalLaneLean
end HautevilleHouse