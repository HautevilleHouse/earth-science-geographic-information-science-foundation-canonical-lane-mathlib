import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure SpatialEntropyPackage where
  shannonEntropy : Prop
  conditionalEntropy : Prop
  mutualInformation : Prop
  entropyRate : Prop
  shannonEntropyClosed : shannonEntropy
  conditionalEntropyClosed : conditionalEntropy
  mutualInformationClosed : mutualInformation
  entropyRateClosed : entropyRate

structure SpatialEntropyEvidence (S : SpatialEntropyPackage) where
  shannonEntropyClosed : S.shannonEntropy
  conditionalEntropyClosed : S.conditionalEntropy
  mutualInformationClosed : S.mutualInformation
  entropyRateClosed : S.entropyRate

def SpatialEntropyClosed (S : SpatialEntropyPackage) : Prop :=
  S.shannonEntropy ∧ S.conditionalEntropy ∧ S.mutualInformation ∧ S.entropyRate

theorem spatial_entropy_closed_from_evidence (S : SpatialEntropyPackage)
    (E : SpatialEntropyEvidence S) : SpatialEntropyClosed S := by
  exact And.intro E.shannonEntropyClosed
    (And.intro E.conditionalEntropyClosed
      (And.intro E.mutualInformationClosed E.entropyRateClosed))

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse