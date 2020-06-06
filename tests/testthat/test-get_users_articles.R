test_that("gets users articles", {
  vcr::use_cassette("get_users_articles", {
    response <- dev.to.ol::get_users_articles()
  })

  expect_is(response, "response")
  expect_equal(response$status_code, 200)
})
