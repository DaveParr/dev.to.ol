test_that("parsing articles works", {
  article <- parse_article("../fixtures/test_post.Rmd")

  expect_equal(article$file_frontmatter$title, "test title")
  expect_equal(article$file_frontmatter$description, "abstract text")
  expect_equal(article$file_frontmatter$tags,
               list("test", "test1", "test2"))
  expect_equal(article$file_string, "This is an original post\n")
})

test_that("parsing articles with awkward titles", {
  article <- parse_article("../fixtures/test_questionmark_title.Rmd")

  expect_equal(article$file_frontmatter$title, "test title?")
  expect_equal(article$file_string, "This is an original post\n")
})

test_that("parsing articles with awkward titles", {
  article <- parse_article("../fixtures/test_fullstop_title.Rmd")

  expect_equal(article$file_frontmatter$title, "test title.")
  expect_equal(article$file_string, "This is an original post\n")
})
