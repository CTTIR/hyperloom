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

* local: macOS (aarch64), R 4.6.1 — `R CMD check --as-cran --no-manual`
  (no LaTeX installation available locally, hence `--no-manual`)
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

  This WARNING is the submission blocker described above; it disappears
  once the four members are on CRAN. The ordinary checks (GitHub Actions,
  without the incoming-feasibility step) pass with 0 errors, 0 warnings and
  0 notes.

## Downstream dependencies

There are currently no downstream dependencies on CRAN.
