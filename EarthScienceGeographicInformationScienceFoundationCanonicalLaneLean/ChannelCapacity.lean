import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure ChannelCapacityPackage where
  inputAlphabet : Type u
  outputAlphabet : Type v
  channelMatrix : inputAlphabet → outputAlphabet → ℝ
  capacity : ℝ
  capacityNonnegative : capacity ≥ 0
  capacityNonnegativeTerm : capacityNonnegative
  capacityAchievable : Prop
  capacityAchievableTerm : capacityAchievable

structure ChannelCapacityEvidence (C : ChannelCapacityPackage) where
  capacityNonnegativeClosed : C.capacityNonnegative
  capacityAchievableClosed : C.capacityAchievable

def ChannelCapacityClosed (C : ChannelCapacityPackage) : Prop :=
  C.capacityNonnegative ∧ C.capacityAchievable

theorem channel_capacity_closed_from_evidence (C : ChannelCapacityPackage) (E : ChannelCapacityEvidence C) :
    ChannelCapacityClosed C := by
  exact And.intro E.capacityNonnegativeClosed E.capacityAchievableClosed

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse