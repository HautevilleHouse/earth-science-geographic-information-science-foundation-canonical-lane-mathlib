import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure SpatialStatisticsPackage where
  spatialAutocorrelation : Type u
  variogramModel : Type w
  krigingEstimator : Type v
  stationarityAssumption : Prop
  isotropicAssumption : Prop
  spatialAutocorrelationComputed : Prop
  variogramFitted : Prop
  krigingPredictionsValid : Prop

structure SpatialStatisticsEvidence (S : SpatialStatisticsPackage) where
  spatialAutocorrelationComputedClosed : S.spatialAutocorrelationComputed
  variogramFittedClosed : S.variogramFitted
  krigingPredictionsValidClosed : S.krigingPredictionsValid

def SpatialStatisticsClosed (S : SpatialStatisticsPackage) : Prop :=
  S.spatialAutocorrelationComputed ∧ S.variogramFitted ∧ S.krigingPredictionsValid

theorem spatial_statistics_closed_from_evidence (S : SpatialStatisticsPackage) (E : SpatialStatisticsEvidence S) : SpatialStatisticsClosed S := by
  exact And.intro E.spatialAutocorrelationComputedClosed (And.intro E.variogramFittedClosed E.krigingPredictionsValidClosed)

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse