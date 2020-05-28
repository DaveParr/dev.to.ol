library("testthat")
library("webmockr")
library("crul")

webmockr::stub_registry_clear()

webmockr::stub_request("get", "https://dev.to/api/articles/me") %>%
  webmockr::to_return(body = "success!", status = 200)

response <- dev.to.ol::get_users_articles()

test_that("stubbed response is 200", {
  expect_is(response, "response")
  expect_equal(response$status_code, 200)
})
