import HautevilleHouse.ComputerVisionCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ComputerVisionWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ComputerVisionCanonicalLaneLean
end HautevilleHouse