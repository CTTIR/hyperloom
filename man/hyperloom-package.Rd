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

To retain installed versions that satisfy declared requirements while installing
missing dependencies, pass \code{upgrade = "never"} to the installer.
An installed dependency that is too old must then be updated explicitly.
Unless \code{R_REMOTES_UPGRADE} sets another policy, the default asks
interactively and permits updates non-interactively.
GitHub members follow their default branches; pinning the metapackage alone
does not pin them. Record each member's \code{Version} and, when present,
\code{RemoteSha} with \code{utils::packageDescription()} for reproducibility.

The Cubert CUVIS SDK is not required for a stub installation of \pkg{cuvis.r}.
SDK-backed operations require separate SDK installation, configuration and
reinstallation of that member. Optional backends, compilers and system
libraries are configured as described by the individual packages. Each member
and external component retains its own license.

GitHub installation is the tested distribution route. The declared R minimum
is 4.1.0; the maintenance candidate was tested on R 4.6.1, macOS arm64.
CRAN incoming checks report the non-CRAN members and repository metadata;
a successful GitHub installation does not establish CRAN submission readiness.
}
\seealso{
\url{https://github.com/CTTIR/hyperloom}
}
\author{
R. Heller \email{raban.heller@charite.de}
}
\keyword{package}
