import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean

structure RasterAnalysisPackage where
  rasterGrid : Type u
  mapAlgebra : Type v
  localOperators : Prop
  focalOperators : Prop
  zonalOperators : Prop
  rasterAlgebraComplete : Prop

structure RasterAnalysisEvidence (R : RasterAnalysisPackage) where
  localOperatorsClosed : R.localOperators
  focalOperatorsClosed : R.focalOperators
  zonalOperatorsClosed : R.zonalOperators
  rasterAlgebraCompleteClosed : R.rasterAlgebraComplete

def RasterAnalysisClosed (R : RasterAnalysisPackage) : Prop :=
  R.localOperators ∧ R.focalOperators ∧ R.zonalOperators ∧ R.rasterAlgebraComplete

theorem raster_analysis_closed_from_evidence (R : RasterAnalysisPackage) (E : RasterAnalysisEvidence R) : RasterAnalysisClosed R := by
  exact And.intro E.localOperatorsClosed (And.intro E.focalOperatorsClosed (And.intro E.zonalOperatorsClosed E.rasterAlgebraCompleteClosed))

end EarthScienceGeographicInformationScienceFoundationCanonicalLaneLean
end HautevilleHouse