import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure ShannonEntropyPackage where
  sourceAlphabet : Type u
  probabilityDistribution : sourceAlphabet → ℝ
  entropy : ℝ
  entropyNonnegative : entropy ≥ 0
  entropyNonnegativeTerm : entropyNonnegative
  maxEntropyUniform : Prop
  maxEntropyUniformTerm : maxEntropyUniform

structure ShannonEntropyEvidence (P : ShannonEntropyPackage) where
  entropyNonnegativeClosed : P.entropyNonnegative
  maxEntropyUniformClosed : P.maxEntropyUniform

def ShannonEntropyClosed (P : ShannonEntropyPackage) : Prop :=
  P.entropyNonnegative ∧ P.maxEntropyUniform

theorem shannon_entropy_closed_from_evidence (P : ShannonEntropyPackage) (E : ShannonEntropyEvidence P) :
    ShannonEntropyClosed P := by
  exact And.intro E.entropyNonnegativeClosed E.maxEntropyUniformClosed

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse