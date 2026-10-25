#' List the hyperspectral imaging suite
#'
#' Return the four packages included in the CTTIR Hyperspectral Imaging Suite.
#' The inventory is independent of installed versions and does not load
#' package namespaces, initialize instruments, or access the network.
#'
#' @return A character vector of package names in suite order.
#' @export
#' @examples
#' hyperloom_packages()
hyperloom_packages <- function() {
  c("hyperspectR", "hyperspectaculR", "cuvis.r", "tivis.r")
}

#' Report installed hyperspectral imaging suite versions
#'
#' Inspect the R libraries in `.libPaths()`. When a package exists in multiple
#' libraries, report the first installation in library search order.
#' This function reads installation metadata; it does not initialize the
#' CUVIS SDK or establish whether an instrument, calibration, or workflow is
#' operational. It does not install or update packages.
#'
#' @return A data frame with one row per suite member and columns `package`
#'   (character), `installed` (logical), and `version` (character). A missing
#'   installation has `installed = FALSE` and `version = NA_character_`.
#' @export
#' @examples
#' hyperloom_status()
hyperloom_status <- function() {
  packages <- hyperloom_packages()
  installed <- utils::installed.packages()
  index <- match(packages, installed[, "Package"])
  data.frame(
    package = packages,
    installed = !is.na(index),
    version = unname(installed[index, "Version"]),
    stringsAsFactors = FALSE
  )
}
