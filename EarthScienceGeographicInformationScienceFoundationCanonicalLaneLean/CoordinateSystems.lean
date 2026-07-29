import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundation

structure CoordinateSystem where
  datum : String
  projection : String
  units : String

def isGeographic (cs : CoordinateSystem) : Prop :=
  cs.projection = "none" ∧ cs.units = "degrees"

def isProjected (cs : CoordinateSystem) : Prop :=
  cs.projection ≠ "none"

theorem coordinate_system_partition (cs : CoordinateSystem) : isGeographic cs ∨ isProjected cs := by
  by_cases h : cs.projection = "none"
  · left; exact And.intro h (by rfl)
  · right; exact h

end EarthScienceGeographicInformationScienceFoundation
end HautevilleHouse