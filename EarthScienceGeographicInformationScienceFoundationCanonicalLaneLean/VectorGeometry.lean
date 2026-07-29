import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundation

structure Point3D where
  x : Float
  y : Float
  z : Float

structure LineSegment where
  start : Point3D
  end_ : Point3D

def lineLength (l : LineSegment) : Float :=
  Math.sqrt ((l.end_.x - l.start.x)^2 + (l.end_.y - l.start.y)^2 + (l.end_.z - l.start.z)^2)

theorem line_length_nonnegative (l : LineSegment) : lineLength l ≥ 0 := by
  unfold lineLength
  exact Real.sqrt_nonneg _

end EarthScienceGeographicInformationScienceFoundation
end HautevilleHouse