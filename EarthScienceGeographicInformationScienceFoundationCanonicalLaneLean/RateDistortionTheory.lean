import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure RateDistortionPackage where
  sourceAlphabet : Type u
  reproductionAlphabet : Type v
  distortionMeasure : sourceAlphabet → reproductionAlphabet → ℝ
  rateDistortionFunction : ℝ → ℝ
  convexity : Prop
  convexityTerm : convexity
  operationalEquivalence : Prop
  operationalEquivalenceTerm : operationalEquivalence

structure RateDistortionEvidence (R : RateDistortionPackage) where
  convexityClosed : R.convexity
  operationalEquivalenceClosed : R.operationalEquivalence

def RateDistortionClosed (R : RateDistortionPackage) : Prop :=
  R.convexity ∧ R.operationalEquivalence

theorem rate_distortion_closed_from_evidence (R : RateDistortionPackage) (E : RateDistortionEvidence R) :
    RateDistortionClosed R := by
  exact And.intro E.convexityClosed E.operationalEquivalenceClosed

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse