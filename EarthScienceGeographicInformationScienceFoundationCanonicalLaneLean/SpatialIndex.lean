import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure RTree where
  maxDegree : ℕ
  minDegree : ℕ
  spatialDataType : Type u
  maxDegreePositive : maxDegree > 0
  minDegreeLessThanMax : minDegree < maxDegree
  minDegreeAtLeastOne : minDegree ≥ 1
  spatialDataTypeNonempty : Nonempty spatialDataType

structure GridIndex where
  cellSize : ℝ
  resolution : ℕ × ℕ
  cellSizePositive : cellSize > 0
  resolutionPositive : resolution.1 > 0 ∧ resolution.2 > 0

structure QuadTree where
  maxDepth : ℕ
  capacity : ℕ
  spatialDataType : Type v
  maxDepthNonzero : maxDepth > 0
  capacityPositive : capacity > 0
  spatialDataTypeNonempty : Nonempty spatialDataType

structure SpatialIndexPackage where
  rTrees : List RTree
  gridIndices : List GridIndex
  quadTrees : List QuadTree

def SpatialIndexClosed (I : SpatialIndexPackage) : Prop :=
  (∀ r ∈ I.rTrees, r.maxDegreePositive ∧ r.minDegreeLessThanMax ∧ r.minDegreeAtLeastOne) ∧
  (∀ g ∈ I.gridIndices, g.cellSizePositive ∧ g.resolutionPositive) ∧
  (∀ q ∈ I.quadTrees, q.maxDepthNonzero ∧ q.capacityPositive)

theorem spatial_index_closed_from_package (I : SpatialIndexPackage)
    (hRTrees : ∀ r ∈ I.rTrees, r.maxDegreePositive ∧ r.minDegreeLessThanMax ∧ r.minDegreeAtLeastOne)
    (hGrid : ∀ g ∈ I.gridIndices, g.cellSizePositive ∧ g.resolutionPositive)
    (hQuad : ∀ q ∈ I.quadTrees, q.maxDepthNonzero ∧ q.capacityPositive) :
    SpatialIndexClosed I := by
  exact And.intro hRTrees (And.intro hGrid hQuad)

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse