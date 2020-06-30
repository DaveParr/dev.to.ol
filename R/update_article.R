#' @title Update a post on dev.to
#' @description Updates an existing post on dev.to by id with content from and .Rmd
#' @param id The id of the post to update as a string
#' @param file The path to the file
#' @param key Your API key, Default: NA
#' @return A response object
#' @details The id of the post must be supplied, and can be returned by the \code{\link[dev.to.ol]{get_users_articles}} function
#' @examples
#' \dontrun{
#' if(interactive()){
#'  update_article(id = "369520", file = "./article.Rmd")
#'  }
#' }
#' @seealso
#'  \code{\link[rmarkdown]{yaml_front_matter}},\code{\link[rmarkdown]{render}}
#'  \code{\link[purrr]{map}}
#'  \code{\link[stringr]{str_remove}}
#'  \code{\link[readr]{read_file}}
#'  \code{\link[glue]{glue}}
#'  \code{\link[httr]{PUT}},\code{\link[httr]{add_headers}}
#' @rdname update_article
#' @export
#' @importFrom rmarkdown yaml_front_matter render
#' @importFrom purrr map
#' @importFrom stringr str_remove_all str_remove
#' @importFrom readr read_file
#' @importFrom glue glue
#' @importFrom httr PUT add_headers
update_article <- function(id,
                           file,
                           key = NA) {
  check_internet()

  check_file <- is_postable_Rmd(file)

  article <- parse_article(file = file)

  response <- httr::PUT(
    url = glue::glue("https://dev.to/api/articles/{id}", id = id),
    httr::add_headers("api-key" = api_key(key = key)),
    user_agent,
    body = list(
      article = list(
        title = article$file_frontmatter$title,
        series = article$file_frontmatter$series,
        published = article$file_frontmatter$published,
        tags = article$file_frontmatter$tags,
        body_markdown = article$file_string,
        main_image = article$file_frontmatter$main_image,
        description = article$file_frontmatter$description
      )
    ),
    encode = 'json'
  )

  check_json(response)

  check_status(response, operation = "updateArticle", expected = 200)

  response

}
