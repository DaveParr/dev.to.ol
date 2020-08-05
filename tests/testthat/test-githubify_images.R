test_that("githubify image works", {
  githubify_images(
    article_string = "some text``` r
plot(mtcars)
```

![](/home/local_user/folder/project/test_githubifying_images_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->",
    local_image_path = "/home/user/folder/project",
    github_user = "GITHUB_USER",
    github_repo = "GITHUB_REPO",
    github_branch = "GITHUB_BRANCH"
  ) -> gh_article_string

  expect_equal(
    gh_article_string,
    "some text``` r\nplot(mtcars)\n```\n\n![](/home/local_user/folder/project/test_githubifying_images_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->"
  )
})
