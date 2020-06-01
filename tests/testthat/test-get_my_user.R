library("testthat")
library("webmockr")
library("httr")

webmockr::enable(adapter = "httr")

webmockr::stub_registry_clear()

webmockr::stub_request("get", "https://dev.to/api/users/me") %>%
  webmockr::to_return(body = "success!", status = 200)

my_user <- dev.to.ol::get_my_user()

test_that("stubbed response is 200", {
  expect_is(my_user, "response")
  expect_equal(my_user$status_code, 200)
})

