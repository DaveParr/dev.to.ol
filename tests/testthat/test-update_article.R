test_that("update an existing article", {
  # To record this test, you need have an article existing already, and to know the id of that article

  vcr::use_cassette("put_update_article", {
    updated_article <- dev.to.ol::update_article(id = "374200", file = "../fixtures/test_update.Rmd")
  })

  expect_is(updated_article, "response")
  expect_equal(updated_article$status_code, 200)

  updated_article_content <- content(updated_article)

  expect_equal(updated_article_content$title, "test title updated")
  expect_equal(updated_article_content$description, "abstract text updated")
  expect_equal(updated_article_content$tag_list, "test, test1, test2, updated1")
})
