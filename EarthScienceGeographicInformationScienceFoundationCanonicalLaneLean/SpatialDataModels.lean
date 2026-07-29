import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure GeographicEntity where
  geometry : Type u
  attributes : Type v
  crs : String

structure RasterModel where
  gridDimensions : Nat × Nat
  cellSize : Float
  bands : List String
  bandCount : Nat
  validExtent : String

structure VectorModel where
  featureType : String
  coordinateDimension : Nat
  topologicalConsistency : Prop
  topologicalConsistencyTerm : topologicalConsistency

structure SpatialDataPackage where
  raster : RasterModel
  vector : VectorModel
  entity : GeographicEntity
  coordinateReferenceSystem : String
  dataIntegrity : Prop
  dataIntegrityTerm : dataIntegrity

structure SpatialDataEvidence (S : SpatialDataPackage) where
  rasterValid : S.raster.gridDimensions.1 > 0 ∧ S.raster.gridDimensions.2 > 0
  vectorTopologyClosed : S.vector.topologicalConsistency
  crsRecognized : S.entity.crs = S.coordinateReferenceSystem
  integrityClosed : S.dataIntegrity

def SpatialDataClosed (S : SpatialDataPackage) : Prop :=
  S.raster.gridDimensions.1 > 0 ∧ S.raster.gridDimensions.2 > 0 ∧
  S.vector.topologicalConsistency ∧ S.dataIntegrity

theorem spatial_data_closed_from_evidence (S : SpatialDataPackage) (E : SpatialDataEvidence S) :
    SpatialDataClosed S := by
  exact And.intro E.rasterValid
    (And.intro E.vectorTopologyClosed E.integrityClosed)

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse
