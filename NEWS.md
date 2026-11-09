# hyperloom 0.2.0

* Prepare for CRAN: remove the `Remotes` field and install the suite through
  the CTTIR R-universe declared in `Additional_repositories`; update the
  installation instructions in README and the package help page accordingly.
* Reword the Description in complete sentences and add `cran-comments.md`.
* Update the maintainer e-mail address to raban.heller@uni-ulm.de.
* Includes the unreleased 0.1.2 changes listed below.

# hyperloom 0.1.2 (development version, not released)

* Check the installed metapackage contract during R CMD check: all four
  members must be discoverable, while loading hyperloom attaches only itself
  and activates no member namespace or native library.
* Document controlled dependency updates, version/revision recording, and
  the distinction between a no-SDK installation and CUVIS SDK operations.
* Use a license link that remains valid in packaged documentation.

# hyperloom 0.1.1

* The logo marks the suite with the CTTIR gold border it shares with cttiR,
  while keeping its topic colours.

* Standardize the named v5 package logo across README, documentation pages
  and available application headers, with matching light and dark artwork.


* Simplify the metapackage to an installation-only framework.
* Declare the four suite members as required installation dependencies without
  attaching them when the metapackage is loaded.
* Remove inventory helpers and their implementation-specific documentation.

# hyperloom 0.1.0

* Introduce the CTTIR Hyperspectral Imaging Suite metapackage with
  hyperspectR, hyperspectaculR, cuvis.r, and tivis.r as required dependencies.
* Add suite membership and installed-version reporting.
* Document installation, package roles, and instrument prerequisites.
