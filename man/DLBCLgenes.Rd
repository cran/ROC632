\name{DLBCLgenes}
\alias{DLBCLgenes}
\docType{data}
\title{
The data concerning the gene expressions of the DLBCL patients
}
\description{
A matrix with the 7399 gene expressions of the 240 DLBCL patients.
}
\usage{data(DLBCLgenes)}
\format{
  A matrix with 240 observations (raws) with the 7399 genes (columns).
}
\details{
Rosenwald et al. (2002) have evaluated tumor samples from 240 DLBCL patients treated with anthracycline based therapy. The missing data were replaced according to the mean expression level of the nearest 8 genes.
}
\source{
the data is published at http://llmpp.nih.gov/lymphoma/data.shtml.
}
\references{
Rosenwald et al. The use of molecular profiling to predict survival after chemotherapy for diffuse large-b-cell lymphoma. New England Journal of Medicine, 346(25):1937-47, 2002.



Alizadeh et al. Distinct types of diffuse large b-cell lymphoma identified by gene expression profiling. Nature, 403(6769):503-11, 2000.
}
\examples{
data(DLBCLpatients)
data(DLBCLgenes)

### Patients survival according to the two subgroups defined by using
### the median of the first gene
plot(survfit(Surv(t, f) ~ I(DLBCLgenes[,1] > median(DLBCLgenes[,1])),
 data = DLBCLpatients), xlab="Survival time (in years)",
 ylab="Patient survival", mark.time=FALSE)
}
\keyword{gene expressions}
\keyword{diffuse large-b-cell lymphoma}
\keyword{Rosenwald}

