import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundation

structure RasterLayer where
  rows : Nat
  cols : Nat
  cellSize : Float
  noDataValue : Float
  data : Array Float

def rasterArea (r : RasterLayer) : Float :=
  (r.rows).toFloat * (r.cols).toFloat * r.cellSize * r.cellSize

theorem raster_area_nonnegative (r : RasterLayer) : rasterArea r ≥ 0 := by
  unfold rasterArea
  positivity

end EarthScienceGeographicInformationScienceFoundation
end HautevilleHouse