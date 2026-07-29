import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure RasterModel where
  cellSize : ℝ
  extent : ℝ × ℝ
  resolution : ℕ × ℕ
  coordinateSystem : GeographicCoordinateSystem
  valueScale : Type u
  cellSizePositive : cellSize > 0
  extentNonempty : extent.2 > extent.1
  resolutionPositive : resolution.1 > 0 ∧ resolution.2 > 0

structure VectorModel where
  geometryTypes : List String
  topologySupported : Prop
  attributeDomains : Type v
  coordinateSystem : GeographicCoordinateSystem
  geometryTypesFinite : geometryTypes ≠ []
  topologySupportedTerm : topologySupported

structure SpatialDataModel where
  rasterModels : List RasterModel
  vectorModels : List VectorModel
  consistencyCondition : Prop
  consistencyConditionTerm : consistencyCondition

def SpatialDataModelClosed (M : SpatialDataModel) : Prop :=
  M.consistencyCondition

theorem spatial_data_model_closed (M : SpatialDataModel) :
    SpatialDataModelClosed M := by
  exact M.consistencyConditionTerm

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse