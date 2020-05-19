post_new_article <- function(key = NA, article) {
  body_string <-
    '{"article": {"title": "Hello, World!","published": true,"body_markdown": "Hello DEV, this is my first post","tags": ["discuss","help"],"series": "Hello series","canonical_url": "https://example.com/blog/hello"}}'

  body_json <- jsonlite::fromJSON(body_string)

  response <- httr::POST(
    url = "https://dev.to/api/articles",
    httr::add_headers("api-key" =
                        if (!is.na(key)) {
                          key
                        } else {
                          message("Using DEVTO in .Reinviron")
                          Sys.getenv(x = "DEVTO")
                        }),
    body = list(article = list(title = 'title',
                               body_markdown= "Body")),
    encode = 'json',
    httr::verbose()
  )
  httr::content(response)
}
