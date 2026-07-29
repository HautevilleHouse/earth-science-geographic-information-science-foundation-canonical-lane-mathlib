import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  EarthScienceWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A :=
  A.object.conclusion

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse
