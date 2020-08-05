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
#' dev.to will not allow tags with spaces, so tags with spaces will be automatically collapsed.
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
    check_internet()

    article <- parse_article(file = file)

    response <- httr::POST(
      url = "https://dev.to/api/articles",
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

    check_status(response, operation = "createArticle", expected = 201)

    response

  }
