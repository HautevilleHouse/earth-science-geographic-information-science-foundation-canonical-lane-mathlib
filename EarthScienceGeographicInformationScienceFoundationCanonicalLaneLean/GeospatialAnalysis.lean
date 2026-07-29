import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundation

structure BufferZone where
  center : (Float × Float)
  radius : Float
  spatialReference : String

def bufferClosed (b : BufferZone) (p : Float × Float) : Prop :=
  (p.1 - b.center.1)^2 + (p.2 - b.center.2)^2 ≤ b.radius^2

theorem buffer_contains_center (b : BufferZone) : bufferClosed b b.center := by
  unfold bufferClosed
  simp

end EarthScienceGeographicInformationScienceFoundation
end HautevilleHouse