test_that("post new article", {
  vcr::use_cassette("post_new_article", {
    new_article <- dev.to.ol::post_new_article(file = "../fixtures/test_post.Rmd")
  })

  expect_is(new_article, "response")
  expect_equal(new_article$status_code, 201)

  new_article_content <- content(new_article)

  expect_equal(new_article_content$title, "test title")
  expect_equal(new_article_content$description, "abstract text")
  expect_equal(new_article_content$tag_list, "test, test1, test2")
  })
