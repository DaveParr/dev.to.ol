#' @title Replace local links to files with the expected github location.
#' @description The function will look for capitalised environmental variables of the same name as the argument set in an .Renviron
#' @param article_string The article as a string, e.g. from `readr::read_file`
#' @param local_image_path The local path to replace, with github location, e.g. from `"/home/davidparr/Dev/dev.to-posts/"`, Default: '/home/davidparr/Dev/dev.to-posts/'
#' @param github_user PARAM_DESCRIPTION, Default: 'daveparr'
#' @param github_repo PARAM_DESCRIPTION, Default: 'dev.to-posts'
#' @param github_branch PARAM_DESCRIPTION, Default: 'master'
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
