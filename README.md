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

Use R 4.1 or later:

```r
install.packages("remotes")
remotes::install_github("CTTIR/hyperloom", dependencies = NA)
```

The package metadata declares all four members as required dependencies and
identifies their CTTIR GitHub repositories. The installer resolves their
required dependencies recursively. `dependencies = NA` installs required R
dependencies without requesting every optional package.

The Cubert CUVIS SDK requires separate installation and configuration for SDK
operations; see the `cuvis.r` documentation. Compiled dependencies may require
a compiler and platform-specific system libraries. Optional backends remain
under the control of the member packages.

## After installation

Use the member packages directly, for example:

```r
cube <- hyperspectR::hs_example_cube()
hyperspectR::hs_plot_rgb(cube)
```

There is no need to run `library(hyperloom)`. The metapackage provides no
analysis functions, does not attach the member packages, and does not start
instruments or install software when loaded.

## License

`hyperloom` is licensed under the [MIT license](LICENSE.md). Member packages
and external components retain their own licenses.

## Branding

Editable R sources and regeneration instructions are in
[tools/branding](https://github.com/CTTIR/hyperloom/tree/main/tools/branding).
