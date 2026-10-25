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
Install from GitHub with
\code{remotes::install_github("CTTIR/hyperloom", dependencies = NA)}.
The package installer resolves required dependencies recursively using the
repository declarations in the package metadata. Use each member package
directly after installation; loading \pkg{hyperloom} is not required.

The Cubert CUVIS SDK, optional backends, compilers, and system libraries are
configured separately as described by their respective packages. Each member
package and external component retains its own license.
}
\seealso{
\url{https://github.com/CTTIR/hyperloom}
}
\author{
R. Heller \email{raban.heller@charite.de}
}
\keyword{package}
