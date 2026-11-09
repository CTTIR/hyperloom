\docType{package}
\name{hyperloom-package}
\alias{hyperloom}
\alias{hyperloom-package}
\title{CTTIR Hyperspectral Imaging Suite}
\description{
An installation framework for \pkg{hyperspectR}, \pkg{hyperspectaculR},
\pkg{cuvis.r}, and \pkg{tivis.r}, together with their required R dependencies.
The metapackage provides no analysis functions and does not attach its members.
}
\details{
Install the suite from the CTTIR R-universe with
\code{install.packages("hyperloom", repos = c("https://cttir.r-universe.dev",
"https://cloud.r-project.org"))}.
The package installer resolves required dependencies recursively using the
\code{Additional_repositories} declaration in the package metadata. Use each
member package directly after installation; loading \pkg{hyperloom} is not
required.

Pinning the metapackage alone does not pin its members. Record each member's
\code{Version} with \code{utils::packageDescription()} for reproducibility.

The Cubert CUVIS SDK is not required for a stub installation of \pkg{cuvis.r}.
SDK-backed operations require separate SDK installation, configuration and
reinstallation of that member. Optional backends, compilers and system
libraries are configured as described by the individual packages. Each member
and external component retains its own license.

The declared R minimum is 4.1.0. The members are not yet on CRAN, so
\pkg{hyperloom} can only be submitted to CRAN once all four are available
there.
}
\seealso{
\url{https://github.com/CTTIR/hyperloom}
}
\author{
R. Heller \email{raban.heller@uni-ulm.de}
}
\keyword{package}
