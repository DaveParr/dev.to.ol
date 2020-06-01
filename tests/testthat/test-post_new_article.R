library(testthat)
library(vcr)
library(httr)

test_that("post new article", {
  vcr::use_cassette("post_new_article", {
    new_article <- dev.to.ol::post_new_article(file = "./test.Rmd")
  })

  expect_is(new_article, "response")
  expect_equal(new_article$status_code, 201)
})
