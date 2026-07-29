import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure NetworkAnalysisPackage where
  graphModel : Type u
  shortestPathAlgorithm : Type v
  serviceAreaComputation : Type w
  locationAllocation : Type x
  graphConnected : Prop
  shortestPathsComputed : Prop
  serviceAreasComputed : Prop
  allocationsComputed : Prop

structure NetworkAnalysisEvidence (N : NetworkAnalysisPackage) where
  graphConnectedClosed : N.graphConnected
  shortestPathsComputedClosed : N.shortestPathsComputed
  serviceAreasComputedClosed : N.serviceAreasComputed
  allocationsComputedClosed : N.allocationsComputed

def NetworkAnalysisClosed (N : NetworkAnalysisPackage) : Prop :=
  N.graphConnected ∧ N.shortestPathsComputed ∧ N.serviceAreasComputed ∧ N.allocationsComputed

theorem network_analysis_closed_from_evidence (N : NetworkAnalysisPackage) (E : NetworkAnalysisEvidence N) : NetworkAnalysisClosed N := by
  exact And.intro E.graphConnectedClosed (And.intro E.shortestPathsComputedClosed (And.intro E.serviceAreasComputedClosed E.allocationsComputedClosed))

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse