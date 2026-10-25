# hyperloom

**CTTIR Hyperspectral Imaging Suite**

`hyperloom` is an R metapackage that installs the four CTTIR packages for
hyperspectral acquisition, processing, analysis, and visualization. It provides
one suite entry point while keeping the member packages' APIs available directly.

| Package | Role |
| --- | --- |
| [hyperspectR](https://github.com/CTTIR/hyperspectR) | Hyperspectral processing, analysis, and exploration |
| [hyperspectaculR](https://github.com/CTTIR/hyperspectaculR) | Spectral visualization and artistic compositions |
| [cuvis.r](https://github.com/CTTIR/cuvis.r) | Cubert CUVIS SDK bindings and recording access |
| [tivis.r](https://github.com/CTTIR/tivis.r) | TIVITA recording and parameter-image readers |

## Installation

```r
install.packages("remotes")
remotes::install_github("CTTIR/hyperloom", dependencies = NA)
```

R 4.1 or later is required. The four suite packages are required dependencies;
their GitHub sources are declared in `Remotes`. `dependencies = NA` installs
required dependencies without installing every optional analysis backend or
development tool. Installing from source may require the compiler and system
libraries documented by the member packages.

The Cubert CUVIS SDK is installed separately. `cuvis.r` can install in stub mode
without the SDK, but vendor recording operations need the real SDK and a
configured `cuvis.r` installation. Follow the
[cuvis.r instructions](https://github.com/CTTIR/cuvis.r) for that setup.

## Use the suite

```r
library(hyperloom)

hyperloom_packages()
hyperloom_status()
```

`library(hyperloom)` also attaches the four member packages through standard R
dependency handling. Their normal startup messages and hooks still apply.
Use explicit namespaces in analysis scripts to keep function origins clear:

```r
cube <- hyperspectR::hs_example_cube()
hyperspectR::hs_plot_rgb(cube)
```

To inspect the suite without attaching its members, use:

```r
hyperloom::hyperloom_status()
```

The version report reads installed package metadata in `.libPaths()` order.
It does not install software, initialize instruments, or certify a working SDK,
calibration, or analysis workflow. Preserve this report together with
`sessionInfo()` and a project lockfile when documenting an analysis environment.

See `vignette("hyperloom", package = "hyperloom")` for the introductory guide.
The metapackage has no separate analysis engine or application; use each member
package's documentation for its functions and interactive tools.

## Development

The repository includes function documentation, an executable vignette, tests,
and calls to the shared CTTIR check, lint, and coverage workflows. A local package
build and check can be run with:

```sh
R CMD build .
R CMD check --no-manual hyperloom_0.1.0.tar.gz
```

## License

`hyperloom` is licensed under the [MIT License](LICENSE.md). Each dependency and
vendor component retains its own license; the metapackage does not relicense
them. In particular, the Cubert SDK is a separately supplied vendor component.
