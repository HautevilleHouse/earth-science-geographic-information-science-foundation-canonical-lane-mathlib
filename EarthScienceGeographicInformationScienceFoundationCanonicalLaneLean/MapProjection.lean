import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure ConformalProjection where
  scaleFactor : ℝ
  centralMeridian : ℝ
  standardParallel : ℝ
  scaleFactorPositive : scaleFactor > 0
  centralMeridianRange : -180 ≤ centralMeridian ∧ centralMeridian ≤ 180
  standardParallelRange : -90 ≤ standardParallel ∧ standardParallel ≤ 90

structure EqualAreaProjection where
  centralMeridian : ℝ
  standardParallel : ℝ
  falseEasting : ℝ
  falseNorthing : ℝ
  centralMeridianRange : -180 ≤ centralMeridian ∧ centralMeridian ≤ 180
  standardParallelRange : -90 ≤ standardParallel ∧ standardParallel ≤ 90

structure CompromiseProjection where
  centralMeridian : ℝ
  standardParallel : ℝ
  centralMeridianRange : -180 ≤ centralMeridian ∧ centralMeridian ≤ 180
  standardParallelRange : -90 ≤ standardParallel ∧ standardParallel ≤ 90

structure MapProjectionPackage where
  conformalProjections : List ConformalProjection
  equalAreaProjections : List EqualAreaProjection
  compromiseProjections : List CompromiseProjection

def MapProjectionClosed (P : MapProjectionPackage) : Prop :=
  (∀ p ∈ P.conformalProjections, p.scaleFactorPositive ∧ p.centralMeridianRange ∧ p.standardParallelRange) ∧
  (∀ p ∈ P.equalAreaProjections, p.centralMeridianRange ∧ p.standardParallelRange) ∧
  (∀ p ∈ P.compromiseProjections, p.centralMeridianRange ∧ p.standardParallelRange)

theorem map_projection_closed_from_package (P : MapProjectionPackage)
    (hConformal : ∀ p ∈ P.conformalProjections, p.scaleFactorPositive ∧ p.centralMeridianRange ∧ p.standardParallelRange)
    (hEqualArea : ∀ p ∈ P.equalAreaProjections, p.centralMeridianRange ∧ p.standardParallelRange)
    (hCompromise : ∀ p ∈ P.compromiseProjections, p.centralMeridianRange ∧ p.standardParallelRange) :
    MapProjectionClosed P := by
  exact And.intro hConformal (And.intro hEqualArea hCompromise)

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse