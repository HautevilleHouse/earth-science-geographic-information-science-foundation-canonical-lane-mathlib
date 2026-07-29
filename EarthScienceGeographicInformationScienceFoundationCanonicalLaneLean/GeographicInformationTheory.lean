import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure GeographicInformationPackage where
  spatialDomain : Type u
  spatialProcess : spatialDomain → ℝ
  entropyRate : ℝ
  spatialDependence : Prop
  spatialDependenceTerm : spatialDependence
  informationContent : Prop
  informationContentTerm : informationContent

structure GeographicInformationEvidence (G : GeographicInformationPackage) where
  spatialDependenceClosed : G.spatialDependence
  informationContentClosed : G.informationContent

def GeographicInformationClosed (G : GeographicInformationPackage) : Prop :=
  G.spatialDependence ∧ G.informationContent

theorem geographic_information_closed_from_evidence (G : GeographicInformationPackage) (E : GeographicInformationEvidence G) :
    GeographicInformationClosed G := by
  exact And.intro E.spatialDependenceClosed E.informationContentClosed

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse