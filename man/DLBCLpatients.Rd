\name{DLBCLpatients}
\alias{DLBCLpatients}
\docType{data}
\title{
The data concerning the clinical information of the DLBCL patients
}
\description{
A data frame with 240 DLBCL patients. The time-to-event is the time to patient death. This time can be right-censored.
}
\usage{data(DLBCLpatients)}
\format{
  A data frame with 240 observations (rows) with the 8 following variables (columns).
  \describe{
    \item{\code{ident}}{This numeric vector represents the key for patient identification}
    \item{\code{t}}{This numeric vector represents the follow up times (until death or censoring)}
    \item{\code{f}}{This numeric vector represents the failure indicators at the follow-up end (1=death, 0=alive)}
  }
}
\details{
Rosenwald et al. (2002) evaluated tumour samples from 240 DLBCL patients treated with anthracycline based therapy. They confirmed the existence of the two DLBCL subgroups described previously, GCB-like and ABC-like. The overall survival was significantly different among the subgroups, with 5-year survivals of 60\% for the GCB-like and 35\% for ABC-like subgroups. An additional third subtype was described with a 5-year survival of 39\%.
}
\source{
The data is published at http://llmpp.nih.gov/lymphoma/data.shtml.
}
\references{
Rosenwald et al. The use of molecular profiling to predict survival after chemotherapy for diffuse large-b-cell lymphoma. New England Journal of Medicine, 346(25):1937-47, 2002.



Alizadeh et al. Distinct types of diffuse large b-cell lymphoma identiffied by gene expression profiling. Nature, 403(6769):503-11, 2000.
}
\examples{
data(DLBCLpatients)

### Kaplan and Meier estimation of the patient survival
plot(survfit(Surv(t, f) ~ 1, data = DLBCLpatients),
 xlab="Survival time (in years)", ylab="Patient survival",
 mark.time=FALSE)
}
\keyword{datasets}
\keyword{diffuse large-b-cell lymphoma}
\keyword{Rosenwald}

