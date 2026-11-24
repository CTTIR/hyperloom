## README URL correction (24 November 2026)

The reserved Zenodo DOI is now shown as plain text, without a DOI link or
badge. R's URL extraction confirms that the README no longer exposes the
unpublished DOI as a URL. The DOI-related findings below describe earlier
checks, before this correction; the reservation has not been published.

## Submission

This is a new submission — **not yet submittable**.

hyperloom is an installation-only metapackage. It `Imports` the four members
of the CTTIR hyperspectral imaging suite ('hyperspectR', 'hyperspectaculR',
'cuvis.r', 'tivis.r'), which are currently distributed through
<https://cttir.r-universe.dev> (declared in `Additional_repositories`) and are
not yet on CRAN. CRAN does not accept strong dependencies on packages outside
the mainstream repositories, so hyperloom can only be submitted after all four
members have been accepted on CRAN.

## Test environments

* Local: macOS (aarch64-apple-darwin), R 4.6.1, 14 November 2026:
  full `R CMD check --as-cran` on the built source tarball, including
  PDF manual compilation with TinyTeX (TeX Live 2026) and HTML manual
  validation. This supersedes the earlier local check environment.
* GitHub Actions (r-lib/actions v2, `--as-cran`):
  * macOS-latest (release)
  * windows-latest (release)
  * ubuntu-latest (devel, release, oldrel-1)

## R CMD check results

0 errors | 1 warning | 0 notes

* checking CRAN incoming feasibility ... WARNING
  Maintainer: 'R. Heller <raban.heller@uni-ulm.de>'
  New submission
  Strong dependencies not in the CRAN or BioC software repositories:
    hyperspectR, hyperspectaculR, cuvis.r, tivis.r
  Availability using Additional_repositories specification: all yes
  (https://cttir.r-universe.dev)
  Found the following (possibly) invalid URLs:
    URL: https://doi.org/10.5281/zenodo.24426398
      From: README.md
      Status: 404

  This WARNING is the submission blocker described above; it disappears
  once the four members are on CRAN. The DOI is reserved on Zenodo and
  resolves once the record is published. The ordinary checks (GitHub Actions,
  without the incoming-feasibility step) pass with 0 errors, 0 warnings and
  0 notes.

## Downstream dependencies

There are currently no downstream dependencies on CRAN.
