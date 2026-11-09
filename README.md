# hyperloom <picture class="cttir-readme-logo"><source class="cttir-logo-dark-source" media="(prefers-color-scheme: dark)" srcset="man/figures/logo-with-name-dark.png" /><img src="man/figures/logo-with-name.png" align="right" alt="hyperloom logo" width="120" height="139" /></picture>

**CTTIR Hyperspectral Imaging Suite**

`hyperloom` is an installation framework for these four packages and their
required R dependencies:

| Package | Role |
|:--|:--|
| [hyperspectR](https://github.com/CTTIR/hyperspectR) | Hyperspectral processing and analysis |
| [hyperspectaculR](https://github.com/CTTIR/hyperspectaculR) | Hyperspectral visualization |
| [cuvis.r](https://github.com/CTTIR/cuvis.r) | Cubert CUVIS recordings |
| [tivis.r](https://github.com/CTTIR/tivis.r) | TIVITA recordings |

## Installation

The packages declare R 4.1 or later. Install the suite from the CTTIR
R-universe, which builds all four members together with hyperloom:

```r
install.packages(
  "hyperloom",
  repos = c("https://cttir.r-universe.dev", "https://cloud.r-project.org")
)
```

The package metadata declares all four members as required dependencies and
names the CTTIR R-universe in `Additional_repositories`, so installers resolve
the members and their required dependencies recursively. Installing from a
GitHub checkout also works, for example with
`remotes::install_github("CTTIR/hyperloom", dependencies = NA)`, as long as the
R-universe repository is reachable; `dependencies = NA` installs required R
dependencies without requesting every optional package. Pass
`upgrade = "never"` to retain installed versions that satisfy the declared
requirements; an installed dependency that is too old must then be updated
explicitly.

Pinning only hyperloom does not pin its members. Record the actual versions
(and, for GitHub installations, revisions) for a reproducible analysis, and
use a project dependency lockfile when recreating that environment.

`cuvis.r` can compile in stub mode without the Cubert CUVIS SDK, allowing the
suite to install. SDK-backed operations then remain unavailable. Install and
configure the SDK and reinstall `cuvis.r` as described in its documentation
before using those operations. Source installs of compiled dependencies need a
compiler and platform-specific system libraries. Optional backends remain under
the control of the member packages.

## After installation

Use the member packages directly, for example:

```r
cube <- hyperspectR::hs_example_cube()
hyperspectR::hs_plot_rgb(cube)
```

There is no need to run `library(hyperloom)`. The metapackage provides no
analysis functions, does not attach the member packages, and does not start
instruments or install software when loaded.

Record the installed suite without loading its analysis or instrument code:

```r
members <- c("hyperspectR", "hyperspectaculR", "cuvis.r", "tivis.r")
versions <- lapply(members, function(package) {
  utils::packageDescription(package, fields = c("Version", "RemoteSha"))
})
names(versions) <- members
versions
```

`RemoteSha` is available for GitHub installs made by remotes; other installation
sources may report it as missing. hyperloom is not yet on CRAN: its four
members are distributed through the CTTIR R-universe, and hyperloom can only
be submitted to CRAN once all of them are available there.

## License

`hyperloom` is licensed under the [MIT license](https://github.com/CTTIR/hyperloom/blob/main/LICENSE.md). Member packages
and external components retain their own licenses.

## Branding

Editable R sources and regeneration instructions are in
[tools/branding](https://github.com/CTTIR/hyperloom/tree/main/tools/branding).
