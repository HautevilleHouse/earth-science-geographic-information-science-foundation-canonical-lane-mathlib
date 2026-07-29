import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure GeographicCoordinateSystem where
  datum : Type u
  projection : Type v
  coordinateDomain : Type w
  datumDefined : Prop
  projectionLawful : Prop
  coordinateDomainCovered : Prop
  datumDefinedTerm : datumDefined
  projectionLawfulTerm : projectionLawful
  coordinateDomainCoveredTerm : coordinateDomainCovered

structure GeographicSpaceEvidence (G : GeographicCoordinateSystem) where
  datumDefinedClosed : G.datumDefined
  projectionLawfulClosed : G.projectionLawful
  coordinateDomainCoveredClosed : G.coordinateDomainCovered

def GeographicSpaceClosed (G : GeographicCoordinateSystem) : Prop :=
  G.datumDefined ∧ G.projectionLawful ∧ G.coordinateDomainCovered

theorem geographic_space_closed_from_evidence (G : GeographicCoordinateSystem)
    (E : GeographicSpaceEvidence G) : GeographicSpaceClosed G := by
  exact And.intro E.datumDefinedClosed
    (And.intro E.projectionLawfulClosed E.coordinateDomainCoveredClosed)

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse