test_that("gets users articles untidy", {
  vcr::use_cassette("get_users_articles_untidy", {
    response <- dev.to.ol::get_users_articles(tidy = FALSE)
  })

  expect_is(response, "response")
  expect_equal(response$status_code, 200)
})

test_that("gets users articles tidy", {
  response <- dev.to.ol::get_users_articles()

  expect_is(response, "tbl_df")
})
