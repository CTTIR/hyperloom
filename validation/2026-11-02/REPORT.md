# hyperloom 0.1.2 maintenance — 2 November 2026

## Outcome and evidence

The installation-only design is retained. The base-R installed-package test now
protects required member discovery, inert loading, no member attachment/native
library activation, and the absence of an analysis API. Two disposable mutated
packages (member namespace import and Depends attachment) install successfully
but are rejected by the new test. README and package help explain dependency
updates, version/revision recording and CUVIS stub versus SDK operation. The
README license URL now survives packaging. No member algorithm was changed.

| Finding | Evidence and impact | Resolution |
| --- | --- | --- |
| Medium: no automated load-contract protection | NAMESPACE intentionally has no imports; the initial package had no tests. A future import could activate member/native code unexpectedly. | tests/metapackage.R runs in normal R CMD check and rejects both regressions. |
| Low: broken packaged license link | README used LICENSE.md, excluded by .Rbuildignore. | Link to the public repository license. |
| Medium: installation reproducibility unclear | Unpinned Remotes follow member default branches; the observed hyperspectR is a development version. | Explain update policy and record member versions/SHAs; no false promise that pinning hyperloom pins the suite. |
| Distribution gate: CRAN incoming warning | Remotes and non-CRAN/BioC strong dependencies; hyperspectaculR not in the additional R-universe repository. | Retain metadata and warning. GitHub is the tested route; CRAN submission is not ready. |
| Shared CI defect | All six published package checks report OK, while optional Bioc steps fail on missing Suggests. | The earlier local .github repair removes that faulty step; publishing and validating it remains a separate gate. No fabricated Suggests field added here. |

## Actual verification

- Published hyperloom a474ff0 and all four public GitHub members installed in an
  empty suite library, reusing common CRAN dependencies read-only. cuvis.r really
  compiled in its supported no-SDK mode; no instrument operation was attempted.
- Final candidate normal R CMD check: **0 errors, 0 warnings, 0 notes**, including
  its installed test and full PDF manual. Full --as-cran: **0 errors, 1 warning,
  0 notes**. Warning and logs are alongside this record (home paths redacted and trailing
  whitespace trimmed; raw logs retained in the local audit evidence).
- Candidate source archive installed into a separate empty package library;
  installed load contract and README version-recording snippet passed.
- Exact README member example produced a finite 30×30×61 synthetic cube and
  900-pixel RGB plot. Rendered image visually checked. All three manual pages
  reviewed, with readable contents, help and index.
- Actionlint passed for the caller workflow. GitHub reported no Dependabot alerts;
  this is not a comprehensive audit of member/native dependencies.
- Original 63 tracked files and original clean HEAD/status preserved; all 53
  published branding/tooling assets preserved byte for byte. The 34-file source
  archive excludes audit records and branding design tools. Archive hash and
  actual member versions/revisions are in results.json.

Initial missing-member check failure was an environment baseline; the real
installation resolved it. The completed published baseline and candidate both
retain the incoming warning. No checks were weakened or errors suppressed.

## First use

Prerequisites: R >=4.1.0 as declared (observed here: 4.6.1 on macOS arm64), internet
access to public GitHub/CRAN and the compiler/system libraries required by source
builds. Minimum R, Windows and Linux remain qualification work. SDK-backed use
requires the vendor SDK configuration and member reinstallation described by
cuvis.r; the synthetic example does not need it.

```r
install.packages("remotes")
remotes::install_github("CTTIR/hyperloom", dependencies = NA, upgrade = "never")
cube <- hyperspectR::hs_example_cube()
hyperspectR::hs_plot_rgb(cube)
```

This GitHub command installs the published version, not the unpublished candidate.
To use the candidate after required members are installed, build this checkout
with `R CMD build .`, then run `R CMD INSTALL hyperloom_0.1.2.tar.gz`. A too-old
installed dependency must be updated explicitly with upgrade="never".
The metapackage itself need not be loaded to use the members.

## Remaining gates and scope

The three strategy milestones are complete for local GitHub distribution.
Actual platform/minimum-R qualification, clean-machine dependency bootstrap,
vendor SDK/hardware operation and individual member scientific validation remain
outside this metapackage milestone. Member algorithms have their own repository
audits. Floating dependency revisions require project-specific pinning; package
installation alone does not make an analysis reproducible.

Next publication action: review this local candidate and the shared workflow
repair, then obtain authorization to push and observe the candidate hosted matrix.
CRAN distribution additionally needs an agreed dependency-distribution plan.
No push, release, submission, deployment or original-branch change occurred.

Installer behavior reference: [remotes install_github documentation](https://remotes.r-lib.org/reference/install_github.html).
