library("webmockr")
library("crul")
library("testthat")

stub_registry_clear()

# make a stub
stub_request("get", "https://dev.to/api/users/me") %>%
  to_return(body = "success!", status = 200)

stub_registry()

# make the request
z <- dev.to.ol::get_my_user()

# run tests (nothing returned means it passed)
expect_is(z, "response")
expect_equal(z$status_code, 200)
