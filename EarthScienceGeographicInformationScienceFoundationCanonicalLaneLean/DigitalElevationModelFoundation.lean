import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure DigitalElevationModelPackage where
  elevationSurface : Type u
  triangulation : Type v
  contourGeneration : Type w
  hydrologicRouting : Type x
  topographicWetnessIndex : Type y
  demConstructed : Prop
  slopeCalculated : Prop
  aspectCalculated : Prop
  flowAccumulationCalculated : Prop

structure DigitalElevationModelEvidence (D : DigitalElevationModelPackage) where
  demConstructedClosed : D.demConstructed
  slopeCalculatedClosed : D.slopeCalculated
  aspectCalculatedClosed : D.aspectCalculated
  flowAccumulationCalculatedClosed : D.flowAccumulationCalculated

def DigitalElevationModelClosed (D : DigitalElevationModelPackage) : Prop :=
  D.demConstructed ∧ D.slopeCalculated ∧ D.aspectCalculated ∧ D.flowAccumulationCalculated

theorem digital_elevation_model_closed_from_evidence (D : DigitalElevationModelPackage) (E : DigitalElevationModelEvidence D) : DigitalElevationModelClosed D := by
  exact And.intro E.demConstructedClosed (And.intro E.slopeCalculatedClosed (And.intro E.aspectCalculatedClosed E.flowAccumulationCalculatedClosed))

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse