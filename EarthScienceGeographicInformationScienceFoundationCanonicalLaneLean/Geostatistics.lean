import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure KrigingModel where
  variogramFitted : Prop
  semivarianceModel : String
  interpolationPoints : Nat
  variogramFittedTerm : variogramFitted

structure SpatialAutocorrelation where
  moransICalculated : Prop
  gearysCCalculated : Prop
  significanceTested : Prop
  moransICalculatedTerm : moransICalculated
  gearysCCalculatedTerm : gearysCCalculated
  significanceTestedTerm : significanceTested

structure PointPatternAnalysis where
  densityEstimated : Prop
  clusteringDetected : Prop
  hotspotIdentified : Prop
  densityEstimatedTerm : densityEstimated
  clusteringDetectedTerm : clusteringDetected
  hotspotIdentifiedTerm : hotspotIdentified

structure GeostatisticsPackage where
  kriging : KrigingModel
  autocorrelation : SpatialAutocorrelation
  pointPattern : PointPatternAnalysis
  spatialDependency : Prop
  spatialDependencyTerm : spatialDependency

structure GeostatisticsEvidence (G : GeostatisticsPackage) where
  krigingClosed : G.kriging.variogramFitted
  autocorrelationClosed : G.autocorrelation.moransICalculated ∧ G.autocorrelation.gearysCCalculated ∧ G.autocorrelation.significanceTested
  pointPatternClosed : G.pointPattern.densityEstimated ∧ G.pointPattern.clusteringDetected ∧ G.pointPattern.hotspotIdentified
  dependencyClosed : G.spatialDependency

def GeostatisticsClosed (G : GeostatisticsPackage) : Prop :=
  G.kriging.variogramFitted ∧
  (G.autocorrelation.moransICalculated ∧ G.autocorrelation.gearysCCalculated ∧ G.autocorrelation.significanceTested) ∧
  (G.pointPattern.densityEstimated ∧ G.pointPattern.clusteringDetected ∧ G.pointPattern.hotspotIdentified) ∧
  G.spatialDependency

theorem geostatistics_closed_from_evidence (G : GeostatisticsPackage) (E : GeostatisticsEvidence G) :
    GeostatisticsClosed G := by
  exact And.intro E.krigingClosed
    (And.intro E.autocorrelationClosed
      (And.intro E.pointPatternClosed E.dependencyClosed))

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse
