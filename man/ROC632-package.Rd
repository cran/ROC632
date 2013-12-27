\name{ROC632-package}
\alias{ROC632-package}
\docType{package}
\title{
Estimation of prognostic capacity of microarray data.
}
\description{
This package can be used for proposing prognostic scoring systems based on few explanatories variables or based on thousand features from microarray. The methodology is adapted to complete data (penalized logistic regression associated with ROC curve) incomplete time-to-event data (penalized Cox model associated with ROC time-dependent ROC curve).
}
\details{
\tabular{ll}{
Package: \tab ROC632 \cr
Type: \tab Package \cr
Version: \tab 0.6 \cr
Date: \tab 2013-27-12 \cr
License: \tab GPL (>=2) \cr
LazyLoad: \tab yes \cr
}
\tabular{rl}{
ROC \tab This function allows to compute traditional ROC curves (complete data) for \cr
 \eqn{ \mbox{ } } \tab a binary outcome and a continuous marker. \cr
AUC \tab This function computes the area under ROC curve using the trapezoidal rule \cr
 \eqn{ \mbox{ } } \tab based on two vectors of sensitivities and specificities. \cr
boot.ROC \tab This function allows the construction of a prognostic or \cr
 \eqn{ \mbox{ } } \tab a diagnostic signature (complete data) by using bootstrap-based algorithms \cr
 \eqn{ \mbox{ } } \tab for correcting the overfitting. \cr
boot.ROCt \tab This function allows the construction of a prognostic \cr
 \eqn{ \mbox{ } } \tab signature (time-to-event data) by using bootstrap-based algorithms  \cr
 \eqn{ \mbox{ } } \tab for correcting the overfitting. \cr
}
}
\author{
Y. Foucher <Yohann.Foucher@univ-nantes.fr>
}
\references{
R. Danger and Y. Foucher. Time dependent ROC curves for the estimation of true prognostic capacity of microarray data. Statistical Applications in Genetics and Molecular Biology. 2012 Nov 22;11(6):Article 1. 
}
\keyword{ ROC }
\keyword{ 0.632+ }
\keyword{ 0.632 }
\keyword{ cross-validation }

\seealso{
URL: http://www.divat.fr
}
