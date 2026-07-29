import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure CameraModel where
  sensorSize : Nat × Nat
  focalLength : Float
  principalPoint : Float × Float
  distortionParams : List Float

structure ImageFormationPackage where
  camera : CameraModel
  illuminationModel : Prop
  lensBlurModel : Prop
  quantizationModel : Prop
  noiseModel : Prop
  geometricTransform : Prop

structure ImageFormationEvidence (P : ImageFormationPackage) where
  illuminationModelClosed : P.illuminationModel
  lensBlurModelClosed : P.lensBlurModel
  quantizationModelClosed : P.quantizationModel
  noiseModelClosed : P.noiseModel
  geometricTransformClosed : P.geometricTransform

def ImageFormationClosed (P : ImageFormationPackage) : Prop :=
  P.illuminationModel ∧ P.lensBlurModel ∧ P.quantizationModel ∧ P.noiseModel ∧ P.geometricTransform

theorem image_formation_closed_from_evidence (P : ImageFormationPackage) (E : ImageFormationEvidence P) : ImageFormationClosed P := by
  exact And.intro E.illuminationModelClosed
    (And.intro E.lensBlurModelClosed
      (And.intro E.quantizationModelClosed
        (And.intro E.noiseModelClosed E.geometricTransformClosed)))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse
