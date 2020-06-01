library(testthat)
library(vcr)
library(httr)

test_that("post new article", {
  vcr::use_cassette("post_new_article", {
    aa <- dev.to.ol::post_new_article(file = "./test.Rmd")
  })

  expect_is(aa, "response")
})
