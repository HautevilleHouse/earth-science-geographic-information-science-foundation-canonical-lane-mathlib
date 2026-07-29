import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure SpatialStatisticsPackage where
  krigingMethod : Prop
  variogramModel : Prop
  spatialInterpolation : Prop
  uncertaintyQuantification : Prop
  krigingMethodClosed : krigingMethod
  variogramModelClosed : variogramModel
  spatialInterpolationClosed : spatialInterpolation
  uncertaintyQuantificationClosed : uncertaintyQuantification

structure SpatialStatisticsEvidence (S : SpatialStatisticsPackage) where
  krigingMethodClosed : S.krigingMethod
  variogramModelClosed : S.variogramModel
  spatialInterpolationClosed : S.spatialInterpolation
  uncertaintyQuantificationClosed : S.uncertaintyQuantification

def SpatialStatisticsClosed (S : SpatialStatisticsPackage) : Prop :=
  S.krigingMethod ∧ S.variogramModel ∧ S.spatialInterpolation ∧ S.uncertaintyQuantification

theorem spatial_statistics_closed_from_evidence (S : SpatialStatisticsPackage)
    (E : SpatialStatisticsEvidence S) : SpatialStatisticsClosed S := by
  exact And.intro E.krigingMethodClosed
    (And.intro E.variogramModelClosed
      (And.intro E.spatialInterpolationClosed E.uncertaintyQuantificationClosed))

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse