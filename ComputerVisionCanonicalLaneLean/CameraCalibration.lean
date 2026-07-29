import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComputerVisionCanonicalLaneLean

structure CalibrationTarget where
  patternType : String
  patternSize : ℕ × ℕ
  squareSize : ℝ

structure CalibrationParameters where
  intrinsicMatrix : Matrix ℝ 3 3
  distortionCoeffs : Vector ℝ 5
  extrinsics : List (Matrix ℝ 3 4)
  reprojectionError : ℝ

structure CameraCalibrationPackage where
  target : CalibrationTarget
  parameters : CalibrationParameters
  numberOfImages : ℕ
  usedPoints : ℕ

structure CameraCalibrationEvidence (C : CameraCalibrationPackage) where
  targetValid : C.target.squareSize > 0 ∧ C.target.patternSize.1 ≥ 2 ∧ C.target.patternSize.2 ≥ 2
  intrinsicsValid : C.parameters.intrinsicMatrix.det ≠ 0
  extrinsicsValid : ∀ (e : C.parameters.extrinsics), e.det ≠ 0
  reprojectionErrorBounded : C.parameters.reprojectionError < 1.0
  enoughPointsUsed : C.usedPoints ≥ (C.target.patternSize.1 * C.target.patternSize.2) * 5

def CameraCalibrationClosed (C : CameraCalibrationPackage) : Prop :=
  (C.target.squareSize > 0 ∧ C.target.patternSize.1 ≥ 2 ∧ C.target.patternSize.2 ≥ 2) ∧
  C.parameters.intrinsicMatrix.det ≠ 0 ∧
  (∀ (e : C.parameters.extrinsics), e.det ≠ 0) ∧
  C.parameters.reprojectionError < 1.0 ∧
  C.usedPoints ≥ (C.target.patternSize.1 * C.target.patternSize.2) * 5

theorem camera_calibration_closed_from_evidence (C : CameraCalibrationPackage) (E : CameraCalibrationEvidence C) : CameraCalibrationClosed C := by
  exact And.intro E.targetValid (And.intro E.intrinsicsValid (And.intro E.extrinsicsValid (And.intro E.reprojectionErrorBounded E.enoughPointsUsed)))

end ComputerVisionCanonicalLaneLean
end HautevilleHouse