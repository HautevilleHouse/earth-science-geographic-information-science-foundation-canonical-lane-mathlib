import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure GeographicCRS where
  ellipsoid : Type u
  primeMeridian : Type v
  angularUnit : Type w
  ellipsoidDefined : Prop
  primeMeridianDefined : Prop
  angularUnitDefined : Prop
  ellipsoidDefinedTerm : ellipsoidDefined
  primeMeridianDefinedTerm : primeMeridianDefined
  angularUnitDefinedTerm : angularUnitDefined

structure ProjectedCRS where
  geographicCRS : GeographicCRS
  projectionMethod : String
  projectionParameters : Type x
  methodValid : Prop
  parametersValid : Prop
  methodValidTerm : methodValid
  parametersValidTerm : parametersValid

structure VerticalCRS where
  datum : Type y
  verticalUnit : Type z
  datumDefined : Prop
  verticalUnitDefined : Prop
  datumDefinedTerm : datumDefined
  verticalUnitDefinedTerm : verticalUnitDefined

structure CoordinateReferenceSystemPackage where
  geographicCRSs : List GeographicCRS
  projectedCRSs : List ProjectedCRS
  verticalCRSs : List VerticalCRS

def CoordinateReferenceSystemClosed (C : CoordinateReferenceSystemPackage) : Prop :=
  (∀ g ∈ C.geographicCRSs,
    g.ellipsoidDefined ∧ g.primeMeridianDefined ∧ g.angularUnitDefined) ∧
  (∀ p ∈ C.projectedCRSs,
    p.methodValid ∧ p.parametersValid ∧
    (p.geographicCRS ∈ C.geographicCRSs)) ∧
  (∀ v ∈ C.verticalCRSs,
    v.datumDefined ∧ v.verticalUnitDefined)

theorem coordinate_reference_system_closed_from_package
    (C : CoordinateReferenceSystemPackage)
    (hGeographic : ∀ g ∈ C.geographicCRSs,
      g.ellipsoidDefined ∧ g.primeMeridianDefined ∧ g.angularUnitDefined)
    (hProjected : ∀ p ∈ C.projectedCRSs,
      p.methodValid ∧ p.parametersValid ∧ (p.geographicCRS ∈ C.geographicCRSs))
    (hVertical : ∀ v ∈ C.verticalCRSs,
      v.datumDefined ∧ v.verticalUnitDefined) :
    CoordinateReferenceSystemClosed C := by
  exact And.intro hGeographic (And.intro hProjected hVertical)

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse