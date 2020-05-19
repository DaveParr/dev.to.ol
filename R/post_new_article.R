#' @title Post a markdown file to dev.to
#' @description Create a new post well rendered markdown file
#' @param key Your API key, Default: NA
#' @param file The path to the file, Default: file
#' @return The response
#' @details Will look for an api key in the `.REnviron` file. Seems to check if the body is identical to a previous article and error if so with `"Body markdown has already been taken"`.
#' @examples
#' \dontrun{
#' if(interactive()){
#'  post_new_article("./articles/my_article.md")
#'  }
#' }
#' @seealso
#'  \code{\link[httr]{POST}},\code{\link[httr]{add_headers}},\code{\link[httr]{verbose}},\code{\link[httr]{content}}
#'  \code{\link[readr]{read_file}}
#' @rdname post_new_article
#' @export
#' @importFrom httr POST add_headers verbose content
#' @importFrom readr read_file

post_new_article <- function(key = NA, file = file) {

  response <- httr::POST(
    url = "https://dev.to/api/articles",
    httr::add_headers("api-key" =
                        if (!is.na(key)) {
                          key
                        } else {
                          message("Using DEVTO in .Reinviron")
                          Sys.getenv(x = "DEVTO")
                        }),
    body = list(article = list(
      title = 'title',
      body_markdown = readr::read_file(file = file)
    )),
    encode = 'json',
    httr::verbose()
  )
  httr::content(response)
}
