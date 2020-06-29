test_that("update an existing article", {
  # To record this test, you need have an article existing already, and to know the id of that article

  vcr::use_cassette("put_update_article", {
    new_article <- dev.to.ol::update_article(id = "374133", file = "../fixtures/test_update.Rmd")
  })

  expect_is(new_article, "response")
  expect_equal(new_article$status_code, 200)
})
