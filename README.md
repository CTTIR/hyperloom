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

The packages declare R 4.1 or later. The current maintenance candidate was
tested on R 4.6.1, macOS arm64; minimum-R and other-platform operation require
their own checks. Install from GitHub:

```r
install.packages("remotes")
remotes::install_github("CTTIR/hyperloom", dependencies = NA)
```

The package metadata declares all four members as required dependencies and
identifies their CTTIR GitHub repositories. The installer resolves their
required dependencies recursively. `dependencies = NA` installs required R
dependencies without requesting every optional package.

Unless `R_REMOTES_UPGRADE` sets another policy, the installer asks about dependency
updates interactively and permits updates non-interactively. To retain installed versions that
satisfy the declared requirements while installing missing dependencies, use:

```r
remotes::install_github("CTTIR/hyperloom", dependencies = NA, upgrade = "never")
```

This does not upgrade an installed dependency that is too old; update such a
dependency explicitly before retrying installation.

GitHub installation follows the member repositories' default branches, which
can include development versions. Pinning only hyperloom does not pin its
members. Record the actual versions and GitHub revisions for a reproducible
analysis, and pin all required member revisions or use a project dependency
lockfile when recreating that environment.

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
sources may report it as missing. The tested GitHub installation route is
distinct from CRAN submission: members are not all available through CRAN or
Bioconductor, and the R-universe catalogue does not currently include
`hyperspectaculR`. The complete incoming-check warning is retained in the
repository's dated validation record.

## License

`hyperloom` is licensed under the [MIT license](https://github.com/CTTIR/hyperloom/blob/main/LICENSE.md). Member packages
and external components retain their own licenses.

## Branding

Editable R sources and regeneration instructions are in
[tools/branding](https://github.com/CTTIR/hyperloom/tree/main/tools/branding).
