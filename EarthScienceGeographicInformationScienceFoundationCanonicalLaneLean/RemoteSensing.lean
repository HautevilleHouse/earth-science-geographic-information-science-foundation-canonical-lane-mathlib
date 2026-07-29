import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure ImageProcessing where
  atmosphericCorrectionApplied : Prop
  geometricCorrectionApplied : Prop
  pansharpeningCompleted : Prop
  atmosphericCorrectionAppliedTerm : atmosphericCorrectionApplied
  geometricCorrectionAppliedTerm : geometricCorrectionApplied
  pansharpeningCompletedTerm : pansharpeningCompleted

structure Classification where
  landCoverClasses : Nat
  supervisedClassificationTrained : Prop
  accuracyAssessmentPerformed : Prop
  supervisedClassificationTrainedTerm : supervisedClassificationTrained
  accuracyAssessmentPerformedTerm : accuracyAssessmentPerformed

structure ChangeDetection where
  multiTemporalDataAligned : Prop
  changeMapComputed : Prop
  changeStatisticsDerived : Prop
  multiTemporalDataAlignedTerm : multiTemporalDataAligned
  changeMapComputedTerm : changeMapComputed
  changeStatisticsDerivedTerm : changeStatisticsDerived

structure RemoteSensingPackage where
  imageProc : ImageProcessing
  classification : Classification
  changeDetection : ChangeDetection
  sensorCalibration : Prop
  sensorCalibrationTerm : sensorCalibration

structure RemoteSensingEvidence (R : RemoteSensingPackage) where
  imageProcClosed : R.imageProc.atmosphericCorrectionApplied ∧ R.imageProc.geometricCorrectionApplied ∧ R.imageProc.pansharpeningCompleted
  classificationClosed : R.classification.supervisedClassificationTrained ∧ R.classification.accuracyAssessmentPerformed
  changeDetectionClosed : R.changeDetection.multiTemporalDataAligned ∧ R.changeDetection.changeMapComputed ∧ R.changeDetection.changeStatisticsDerived
  calibrationClosed : R.sensorCalibration

def RemoteSensingClosed (R : RemoteSensingPackage) : Prop :=
  (R.imageProc.atmosphericCorrectionApplied ∧ R.imageProc.geometricCorrectionApplied ∧ R.imageProc.pansharpeningCompleted) ∧
  (R.classification.supervisedClassificationTrained ∧ R.classification.accuracyAssessmentPerformed) ∧
  (R.changeDetection.multiTemporalDataAligned ∧ R.changeDetection.changeMapComputed ∧ R.changeDetection.changeStatisticsDerived) ∧
  R.sensorCalibration

theorem remote_sensing_closed_from_evidence (R : RemoteSensingPackage) (E : RemoteSensingEvidence R) :
    RemoteSensingClosed R := by
  exact And.intro E.imageProcClosed
    (And.intro E.classificationClosed
      (And.intro E.changeDetectionClosed E.calibrationClosed))

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse
