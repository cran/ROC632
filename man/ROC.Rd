\name{ROC}
\alias{ROC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimation of the traditional ROC curves (without censoring)
}
\description{
This function performs estimations of ROC curves (without censoring) according to quantitative marker and a binary outcome.
}
\usage{
ROC(status, marker, cut.values)
}
\arguments{
  \item{status}{A numeric vector with the indicators of the disease (e.g. 0=disease-free, 1=disease).}
  \item{marker}{A numeric vector with the values of the quantitative marker.}
  \item{cut.values}{The threshold values of the marker for which the coordinates of the ROC are computed.}
}
\details{
This function computes a traditional ROC curve (without right-censoring). The false positive and negative rates are obtained by estimating the corresponding proportion
}
\value{
The function returns a list. \code{cut.values} is the vector of the input threshold values. \code{TP} and \code{FP} represent the corresponding false and true positive rates.  \code{AUC} is the area under the curve. 
}
\author{
Y. Foucher <Yohann.Foucher@univ-nantes.fr>
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{

# import and attach the data example

X <- c(1, 2, 3, 4, 5, 6, 7, 8) # The value of the marker
Y <- c(0, 0, 0, 1, 0, 1, 1, 1) # The value of the binary outcome

ROC.obj <- ROC(status=Y, marker=X, cut.values=sort(X))
plot(ROC.obj$FP, ROC.obj$TP, ylab="True Positive Rates",
 xlab="False Positive Rates", type="s", lwd=2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ROC curve }
