#' @title FUNCTION_TITLE
#' @description FUNCTION_DESCRIPTION
#' @param article_string PARAM_DESCRIPTION
#' @param pattern PARAM_DESCRIPTION, Default: '/home/davidparr/Dev/dev.to-posts/'
#' @param user PARAM_DESCRIPTION, Default: 'daveparr'
#' @param repo PARAM_DESCRIPTION, Default: 'dev.to-posts'
#' @param branch PARAM_DESCRIPTION, Default: 'master'
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  #EXAMPLE1
#'  }
#' }
#' @seealso
#'  \code{\link[readr]{read_file}}
#'  \code{\link[glue]{glue}}
#' @rdname githubify_images
#' @export
#' @importFrom readr read_file
#' @importFrom glue glue
#' @importFrom stringr str_replace_all str_remove_all

githubify_images <-
  function(article_string,
           pattern = "/home/davidparr/Dev/dev.to-posts/",
           user = "DaveParr",
           repo = "dev.to-posts",
           branch = "master") {
    str_replace_all(
      article_string,
      pattern = pattern,
      replacement =
        glue::glue(
          "https://raw.githubusercontent.com/{user}/{repo}/{branch}/",
          user = user,
          repo = repo,
          branch = branch
        )
    ) %>%
      stringr::str_remove_all("<!-- -->")
  }
