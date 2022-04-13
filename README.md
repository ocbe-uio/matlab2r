# matlab2r: a translation layer from MATLAB to R

This is an R package to facilitate the usage of MATLAB functions in R.

Both languages contain functions with similar purpose, but different names.
This package allows an R user comfortable with MATLAB to use several MATLAB
functions in R.

# Installation

## Stable version

matlab2r is available on CRAN and can be installed by running the following in an interactive R session:

```R
install.packages("matlab2r")
```

## Development version

The development version of the package contains features and bug fixes that are yet to be published. On the other hand, it's much less stable. You can install the development version of matlab2r by running the following command in R (requires the `remotes` package to be installed beforehand):

```R
remotes::install_github("ocbe-uio/matlab2r", "develop")
```

# Contributing

Found a bug? Want a new feature? Please post your thoughts [here](https://github.com/ocbe-uio/matlab2r/issues/new), all contributions are welcome and properly credited!

# Citing

To cite package matlab2r in publications use:

> Waldir Leoncio (2022). matlab2r: Translation Layer from MATLAB to R. R package version 1.0.0. https://CRAN.R-project.org/package=matlab2r

A BibTeX entry for LaTeX users is

```latex
@Manual{,
  title = {matlab2r: Translation Layer from MATLAB to R},
  author = {Waldir Leoncio},
  year = {2022},
  note = {R package version 1.0.0},
  url = {https://CRAN.R-project.org/package=matlab2r},
}
```

# Badges

## Published version

[![cran](https://www.r-pkg.org/badges/version/matlab2r)](https://cran.r-project.org/package=matlab2r)
[![downloads](http://cranlogs.r-pkg.org/badges/grand-total/matlab2r)](https://cran.r-project.org/package=matlab2r)
[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://cran.r-project.org/web/licenses/GPL-3)
[![DOI](https://zenodo.org/badge/452648821.svg)](https://zenodo.org/badge/latestdoi/452648821)


## Development version

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)[![last commit](https://img.shields.io/github/last-commit/ocbe-uio/matlab2r.svg)](https://github.com/ocbe-uio/matlab2r/commits/develop)
[![code size](https://img.shields.io/github/languages/code-size/ocbe-uio/matlab2r.svg)](https://github.com/ocbe-uio/matlab2r)
[![check status](https://github.com/ocbe-uio/matlab2r/workflows/R-CMD-check/badge.svg)](https://github.com/ocbe-uio/matlab2r/actions)
[![codecov](https://codecov.io/gh/ocbe-uio/matlab2r/branch/develop/graph/badge.svg?token=78YFRZKJO6)](https://codecov.io/gh/ocbe-uio/matlab2r)
[![CodeFactor](https://www.codefactor.io/repository/github/ocbe-uio/matlab2r/badge/develop)](https://www.codefactor.io/repository/github/ocbe-uio/matlab2r/overview/develop)
