#' @title Replace local links to files with the expected github location.
#' @description The function will look for capitalised environmental variables of the same name as the argument set in an .Renviron
#' @param article_string The article as a string, e.g. from `readr::read_file`
#' @param local_image_path The local path to the images, Default: Sys.getenv(x = "LOCAL_IMAGE_PATH")
#' @param github_user Your github username, Default: Sys.getenv(x = "GITHUB_USER")
#' @param github_repo The github repo hosting the article and image, Default: Sys.getenv(x = "GITHUB_REPO")
#' @param github_branch The branch on the github repo to publish from, Default: Sys.getenv(x = "GITHUB_BRANCH")
#' @return The article string with the image paths changed from a local path to an expected location on github
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
           local_image_path = Sys.getenv(x = "LOCAL_IMAGE_PATH"),
           github_user = Sys.getenv(x = "GITHUB_USER"),
           github_repo = Sys.getenv(x = "GITHUB_REPO"),
           github_branch = Sys.getenv(x = "GITHUB_BRANCH")) {
    str_replace_all(
      article_string,
      pattern = local_image_path,
      replacement =
        glue::glue(
          "https://raw.githubusercontent.com/{github_user}/{github_repo}/{github_branch}/"
        )
    )
  }
