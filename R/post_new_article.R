#' @title Post a markdown file to dev.to
#' @description Create a new post from an .Rmd
#' @param key Your API key, Default: NA
#' @param file The path to the file, Default: file
#' @return The response
#' @details Will look for an api key in the `.REnviron` file. Seems to check if the body is identical to a previous article and error if so with `"Body markdown has already been taken"`.
#' @examples
#' \dontrun{
#' if(interactive()){
#'  post_new_article("./articles/my_article.Rmd")
#'  }
#' }
#' @seealso
#'  \code{\link[httr]{POST}},\code{\link[httr]{add_headers}},\code{\link[httr]{verbose}},\code{\link[httr]{content}}
#'  \code{\link[readr]{read_file}}, \code{\link[dev.to.ol]{api_key}}, \code{\link[dev.to.ol]{is_postable_article}}
#' @rdname post_new_article
#' @export
#' @importFrom httr POST add_headers verbose content
#' @importFrom readr read_file

post_new_article <- function(file, key = NA) {

  check_file <- is_postable_Rmd(file)

  if (check_file) {
    file_frontmatter <- rmarkdown::yaml_front_matter(file)

    output_path <- rmarkdown::render('./data/test.Rmd',
                                     output_format = 'github_document',
                                     output_dir = getwd())


    file_string <- readr::read_file(output_path)

    response <- httr::POST(
      url = "https://dev.to/api/articles",
      httr::add_headers("api-key" = api_key(key = key)),
      body = list(article = list(
        title = file_frontmatter$title,
        body_markdown = file_string
      )),
      encode = 'json'
    )
    httr::content(response)
  } else {
    message(attr(check_file, "msg"))
  }
}
