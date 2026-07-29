import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure RateDistortionPackage where
  rateDistortionFunction : Prop
  distortionMeasure : Prop
  rateDistortionTheorem : Prop
  achievableRateRegion : Prop
  rateDistortionFunctionClosed : rateDistortionFunction
  distortionMeasureClosed : distortionMeasure
  rateDistortionTheoremClosed : rateDistortionTheorem
  achievableRateRegionClosed : achievableRateRegion

structure RateDistortionEvidence (R : RateDistortionPackage) where
  rateDistortionFunctionClosed : R.rateDistortionFunction
  distortionMeasureClosed : R.distortionMeasure
  rateDistortionTheoremClosed : R.rateDistortionTheorem
  achievableRateRegionClosed : R.achievableRateRegion

def RateDistortionClosed (R : RateDistortionPackage) : Prop :=
  R.rateDistortionFunction ∧ R.distortionMeasure ∧ R.rateDistortionTheorem ∧ R.achievableRateRegion

theorem rate_distortion_closed_from_evidence (R : RateDistortionPackage)
    (E : RateDistortionEvidence R) : RateDistortionClosed R := by
  exact And.intro E.rateDistortionFunctionClosed
    (And.intro E.distortionMeasureClosed
      (And.intro E.rateDistortionTheoremClosed E.achievableRateRegionClosed))

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse