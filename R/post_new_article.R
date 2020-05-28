#' @title Post a markdown file to dev.to
#' @description Create a new post from an .Rmd.
#' @param file The path to the file
#' @param key Your API key, Default: NA
#' @return The response
#' @details Will look for an api key in the `.REnviron` file. Seems to check if the body is identical to a previous article and error if so with `"Body markdown has already been taken"`.
#' The following YAML arguments are read from the file YAML frontmatter if present:
#' \describe{
#'   \item{title}{A character string}
#'   \item{series}{A character string}
#'   \item{published}{A boolean}
#'   \item{tags}{list of character strings: \code{["tag1", "tag2"]}}
#' }
#'
#' The default table output method renders a very large print code block.
#' The workaround is to use  \code{\link[knitr]{kable}}.
#'
#' @examples
#' \dontrun{
#' if(interactive()){
#'  post_new_article("./articles/my_article.Rmd")
#'  }
#' }
#' @seealso
#'  \code{\link[rmarkdown]{yaml_front_matter}},\code{\link[rmarkdown]{render}}
#'  \code{\link[readr]{read_file}}
#'  \code{\link[stringr]{str_remove}}
#'  \code{\link[glue]{glue}}
#'  \code{\link[httr]{POST}},\code{\link[httr]{add_headers}},\code{\link[httr]{content}}
#' @rdname post_new_article
#' @export
#' @importFrom rmarkdown yaml_front_matter render
#' @importFrom readr read_file
#' @importFrom stringr str_remove
#' @importFrom glue glue
#' @importFrom httr POST add_headers content

post_new_article <-
  function(file,
           key = NA) {
    check_file <- is_postable_Rmd(file)

    if (check_file) {
      file_frontmatter <- rmarkdown::yaml_front_matter(file)

      output_path <- rmarkdown::render(file,
                                       output_format = 'github_document',
                                       output_dir = getwd())

      file_string <- readr::read_file(output_path) %>%
        stringr::str_remove(glue::glue("{title}\n================\n\n\n",
                                       title = file_frontmatter$title))

      response <- httr::POST(
        url = "https://dev.to/api/articles",
        httr::add_headers("api-key" = api_key(key = key)),
        body = list(
          article = list(
            title = file_frontmatter$title,
            series = file_frontmatter$series,
            published = file_frontmatter$published,
            tags = file_frontmatter$tags,
            body_markdown = file_string
          )
        ),
        encode = 'json'
      )
      response
    } else {
      message(attr(check_file, "msg"))
    }
  }
