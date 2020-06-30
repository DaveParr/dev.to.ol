#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param file PARAM_DESCRIPTION
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[rmarkdown]{yaml_front_matter}},\code{\link[rmarkdown]{render}}
#'  \code{\link[purrr]{map}}
#'  \code{\link[stringr]{str_remove}}
#'  \code{\link[readr]{read_file}}
#'  \code{\link[glue]{glue}}
#' @rdname parse_article
#' @export
#' @importFrom rmarkdown yaml_front_matter render
#' @importFrom purrr map
#' @importFrom stringr str_remove_all str_remove
#' @importFrom readr read_file
#' @importFrom glue glue
parse_article <- function(file) {
  check_file <- is_postable_Rmd(file)

  if (check_file) {
    file_frontmatter <- rmarkdown::yaml_front_matter(file)

    file_frontmatter$tags <-
      purrr::map(file_frontmatter$tags, stringr::str_remove_all, " ")

    output_path <- rmarkdown::render(file,
                                     output_format = 'github_document',
                                     output_dir = getwd())

    file_string <- readr::read_file(output_path) %>%
      stringr::str_remove(glue::glue("{title}\n================\n\n\n",
                                     title = file_frontmatter$title))

    list(
      file_frontmatter = file_frontmatter,
      output_path = output_path,
      file_string = file_string
    )
  }
}
