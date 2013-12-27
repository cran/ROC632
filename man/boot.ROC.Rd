\name{boot.ROC}
\alias{boot.ROC}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Construction of a diagnostic or prognostic scoring system and estimation of its true diagnostic capacities when the data are complete (without censoring)
}
\description{
This function allows the construction of a diagnostic or prognostic signature by using a logistic regression with lasso penalty. This function also performs estimations of the corresponding ROC curve according to different bootstrap-based approaches. Patients not included in the bootstrap sample are used to correct the overfitting.
}
\usage{
boot.ROC(status, features, N.boot,
 precision, fold.cv, lambda1)
}
\arguments{
  \item{status}{A numeric vector with the indicators of the disease (e.g. 0=disease-free, 1=disease).}
  \item{features}{A matrix with the observed features. The number of raw is the number of individuals (equals to the length of the vector \code{status}).}
  \item{N.boot}{Number of bootstrap iterations.}
  \item{precision}{The quintiles of the predictor used for computing each point of the ROC curve.}
  \item{lambda1}{The fixed values of the tuning parameters for L1 (lasso). If \code{NULL} (default value), its value is obtained by cross-validation for the overall sample and at each bootstrap iteration. The reference approach is to re-estimate the tuning parameter and to select the features at each bootstrap iteration. Nevertheless, the 0.632+ estimator appeared to be robust when the tuning was estimated on the full data set and re-used at each step for the features selection.  This assumption is associated to an important time-saving. Nevertheless, the complete re-estimation of the model at each iteration remains less open to criticism.}
   \item{fold.cv}{The fold for cross-validation which is only used if \code{lambda1=NULL}. By default, A 5-fold cross-validation is implemented.}
}
\details{
This function does not deal with censored data. First, this function returns the results of the penalized logistic regression. By default, all the corresponding parameters (including the tuning parameter obtained by cross-validation which defined the number of variables selected in the linear predictor) are obtained from the total sample. The user can also define the value of the tuning parameter. Second, because the resulting scoring system may be associated with overfitting, internal validation is needed. At each iteration and based on each bootstrap sample, a logistic regression with lasso penalty is estimated. By default, the value of the tuning parameter is also determined by cross-validation on each bootstrap sample. Nevertheless, if \code{lambda1} is defined by the user, the same value is used for all the iterations.  The complete methodology is explained by Danger and Foucher (2012) in the context of incomplete data (right censoring). The application of this method is straightforward: the false positive/negative rates are simply obtained by the corresponding observed proportions in the function \code{boot.ROC}. 
}
\value{
The function returns a list.  \code{AUC} is a data frame. The raw(s) represent(s) the value(s) of the prognostic time. \code{train} is the mean of the areas obtained by using the individuals included in the bootstrap samples (training). \code{valid} is the mean of the areas obtained by using the individuals not included in the bootstrap samples (cross-validation). \code{s632} is the mean of the areas obtained by using the simple 0.632 estimator. \code{p632} is the mean of the areas obtained by using the 0.632+ estimator. \code{ROC.Apparent}, \code{ROC.CV}, \code{ROC.632} and \code{ROC.632p} are 4 data frames in which the false negative and positive rates are presented respectively for the 4 estimators: apparent, bootstrap and cross-validation, bootstrap 0.632 and bootstrap 0.632+. These rates correspond to the thresholds defined in \code{cut.values}. \code{Coef} is a vector of the regression coefficients obtained in the logistic model with lasso penalty obtained by using all subjects. The value of the tuning parameter is equals \code{Lambda}. This model is contained in the object \code{Model}. This object is obtained by using the function penalized() in the R package penalized. Please, look at the corresponding help for more details about the object \code{Model}. Finally, the signature represents the prognostic score for each subject, i.e. the sum of the regression multiplied by the value of the features.
}
\references{
R. Danger and Y. Foucher. Time dependent ROC curves for the estimation of true prognostic capacity of microarray data. Statistical Applications in Genetics and Molecular Biology. 2012 Nov 22;11(6):Article 1. }
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

data(DLBCLpatients)
data(DLBCLgenes)

# In this exemple, we only reduce the number
# of features, threasholds and iterations for time-saving

DLBCLgenes <- DLBCLgenes[,1:500] # 500 first features
N.iterations <- 2

# If we define a priori the tuning parameter at 15.

res <- boot.ROC(status=DLBCLpatients$f,
 features=DLBCLgenes, N.boot=N.iterations,
 precision=seq(0.05, 0.95, by=0.30), lambda1=15)

# The distribution of the prognostic score
hist(res$Signature, nclass=30, main="",
 xlab="Observed values of the multivariate signature")

# Illustrations of the ROC curve
plot(res$ROC.Apparent$FPR, 1-res$ROC.Apparent$FNR,
 type="b", pch=1, lty=1, ylim=c(0,1), xlim=c(0,1),
 ylab="True Positive Rates",
 xlab="False Positive Rates") 
lines(res$ROC.CV$FPR, 1-res$ROC.CV$FNR,
 type="b", pch=2, lty=2) 
lines(res$ROC.632$FPR, 1-res$ROC.632$FNR,
 type="b", pch=3, lty=3) 
lines(res$ROC.632p$FPR, 1-res$ROC.632p$FNR,
 type="b", pch=4, lty=4) 
legend("bottomright",
 paste(c("Apparent", "CV", "0.632", "0.632+"),
 "curve (AUC=", round(res$AUC,2), ")"), pch=1:4,
 lty=1:4)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ 0.632 }
\keyword{ bootstrap }
\keyword{ ROC curve }
