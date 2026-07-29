import HautevilleHouse.ComputerVisionCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure AdmissibleClass where
  object : ComputerVisionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ComputerVisionWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ComputerVisionCanonicalLaneLean
end HautevilleHouse