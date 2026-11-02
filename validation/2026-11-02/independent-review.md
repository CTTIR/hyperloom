# hyperloom final independent review — 2026-11-02

Reviewed the candidate diff against published baseline `a474ff0`, including DESCRIPTION, README, package help, NEWS, build exclusions, maintenance plan, and installed-contract test. No release-blocking defect was found in the reviewed changes. This review does not substitute for the parent-owned final package check or new hosted CI.

## Documentation findings and resolution

The reviewer raised one installer qualification: remotes defaults respect `R_REMOTES_UPGRADE`, and `upgrade = "never"` only selects uninstalled dependencies; it does not repair an installed dependency below its required minimum. The maintainer added both qualifications to README and package help. This closes the identified documentation issue. Behavior was checked against installed remotes 2.5.0 implementation (`resolve_upgrade`, `upgradable_packages`, saved in `remotes-upgrade-review.txt`) and [official install_github documentation](https://remotes.r-lib.org/reference/install_github.html).

Default-branch wording is accurate for the four unpinned Remotes entries; pinning hyperloom alone does not fix member revisions. For complete scientific environment recreation, a dependency lockfile covering the entire graph is stronger than recording only the four member SHAs. No new runtime environment manager is warranted here.

The no-SDK versus SDK-operation distinction is accurate for the inspected published cuvis.r configure scripts: absent SDK headers select compiled stub mode, while SDK operations require configuration and reinstalling that member. The text does not claim hardware or SDK validation. README's package-version/RemoteSha snippet was executed verbatim against the installed suite and returned all four versions/revisions without loading their namespaces (`metadata-snippet-review.log`). The absolute license link resolves the package-layout problem caused by excluded LICENSE.md.

## Test and packaging review

`tests/metapackage.R` uses base-R interfaces available before the declared R 4.1 minimum. It avoids platform paths, shell programs, SDK access, optional packages, and member namespace loads during discovery. Its assertions observe the advertised installation-only boundary rather than duplicating literal DESCRIPTION fields or requiring hook implementation details. A fresh process is required and is the normal R CMD check test-script context. No portability blocker was found by inspection; execution on minimum R, Windows, and Linux remains separately unverified for this candidate.

The test passed against the actual installed public suite. Two independently installed disposable package variants were correctly rejected: importing tivis.r activated its namespace, and putting tivis.r in Depends attached it. Evidence: `contract-installed.log` and `contract-counterfactual.json`. These mutations protect distinct namespace and search-path regressions. Native-library observations are scoped to loading hyperloom, not a guarantee about every possible external side effect.

Version 0.1.2 remains marked unreleased in NEWS. Audit plans/validation are excluded from the source distribution, tests remain included, and no runtime API, dependency declaration, authorship, or branding asset changes were introduced. `git diff --check` passes.

## Retained limitations

- Published baseline hosted package checks succeeded, but the shared optional Bioconductor step failed on missing Suggests in all six jobs. This is recorded in `contract-review.md`; it is not repaired or concealed by this candidate.
- Full incoming-check warnings about non-CRAN members and repository metadata must remain visible; successful GitHub installation establishes neither CRAN readiness nor r-universe availability for every member.
- Local R 4.6.1 macOS validation, minimum-R compatibility, new hosted candidate CI, and real instrument/SDK qualification are distinct claims.
