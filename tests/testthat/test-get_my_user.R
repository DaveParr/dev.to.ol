test_that("gets my user", {
  vcr::use_cassette("get_my_user", {
    my_user <- dev.to.ol::get_my_user()
  })

  expect_is(my_user, "response")
  expect_equal(my_user$status_code, 200)
})

