import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundation

structure SpatialDataSource where
  sourceType : String
  resolution : Float
  coverageArea : Float
  temporalCoverage : String

def sourceQualityMetric (s : SpatialDataSource) : Float :=
  s.resolution * s.coverageArea

theorem source_quality_positive (s : SpatialDataSource) (h : s.resolution > 0) (h' : s.coverageArea > 0) :
  sourceQualityMetric s > 0 := by
  unfold sourceQualityMetric
  exact mul_pos h h'

end EarthScienceGeographicInformationScienceFoundation
end HautevilleHouse