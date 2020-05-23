
<!-- README.md is generated from README.Rmd. Please edit that file -->

# <a href="https://dev.to/daveparr">

<img src="https://d2fltix0v2e0sb.cloudfront.net/dev-badge.svg" alt="Dave Parr's DEV Profile" height="30" width="30">
</a>.to.ol

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of `dev.to.ol` is to help R users publish to dev.to

## Installation

You can install the unreleased version of dev.to from
[github](www.github.com) with:

``` r
remotes::install.github("DaveParr/dev.to.ol")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(dev.to.ol)

post_new_article("./articles/my_article.Rmd")
```

## Authentication

`dev.to.ol` will check for an `.Renviron` file it can access that has a
line like this:

``` sh
DEVTO="my_api_key"
```

You can set up a key on dev.to [here](https://dev.to/settings/account)

Please note that this project is released with a [Contributor Code of
Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree
to abide by its terms.
