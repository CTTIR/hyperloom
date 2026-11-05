# hyperloom public maintenance strategy — 2 November 2026

## Purpose and baseline

Keep this an installation-only metapackage for hyperspectR, hyperspectaculR,
cuvis.r and tivis.r. Success means required suite members install, the documented
member-package quick start works, and loading hyperloom does not attach members,
start instruments or install software. Preserve the deliberate removal of runtime
helpers and the current published gold-border suite branding.

Original clean main bfd3830 remains unchanged. The isolated branch starts from
published a474ff0, incorporating one existing branding commit. All four members
are public and declare R >= 4.1.0; none declares a GitHub Remotes dependency.
Their required R dependency closure is CRAN/base plus these four public members.
The effective minimum supported R remains an external qualification, not a local
observation. GitHub distribution is the documented installation target.

## Selected milestones

1. Establish a real installation baseline. Install published hyperloom and its
   required members into an empty suite library, reusing existing common R
   dependencies read-only. Record actual member versions/revisions, installer
   behavior, native SDK requirements and any failure. Run the documented example
   and inspect its rendered RGB output. This depends on public package downloads
   and available compilers; never treat a stub package as a verified member.
2. Guard the installation/load contract. Add a small base-R installed-package
   check to the normal R CMD check lane. It must verify discoverable installed
   members and no member attachment, startup hooks or DLL activation from loading
   the metapackage. Validate the check against intentional counterfactual failures
   where useful. It adds no runtime API or test-only framework dependency.
3. Make first use and packaging dependable. Repair the README license target
   excluded from built packages. Explain required versus optional dependencies,
   controlled updates, recorded suite versions and the external SDK boundary.
   Keep package help, README and NEWS synchronized. Validate a complete source
   package check, clean install, inert load and actual quick-start plot.

Each milestone ends with observed tests and a separate review. The source package
must preserve existing assets, author metadata and original checkout files.
The handover records commands, exact artifacts, limitations and remaining gates.

## Deferred scope and release criteria

Member algorithm/SDK audits belong to their own sequential repository reviews.
Do not add analysis or environment-management functions to the metapackage.
A complete clean-machine/system-library install, minimum R, vendor hardware and
new candidate hosted CI need separate qualification. No push, release or
submission is authorized by this local maintenance milestone.

Local readiness requires a successful public-member install, working documented
member calls, protected load semantics, a full package check with honest notes,
and a usable source-package/README handover. Audit records and design tooling
stay out of the distribution archive.
