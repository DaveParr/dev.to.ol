#' @title Setup .Renviron
#' @description Write a .Renviron file with the details needed for dev.to
#' @param devto Your API key
#' @param local_image_path The local path prefix your images get stored at, Default: getwd()
#' @param github_user Your GitHub Username
#' @param github_repo Your GitHub Repo with your articles
#' @param github_branch Your GitHub branch that you are publishing from, Default:'main'
#' @return A brand new .Renviron file
#' @details To embed the links to images in dev.to posts, dev.to.ol uses GitHub
#' as an image hosting service. This means that your locally generated images (like graphs)
#' should be committed to a public repo. \code{\link[dev.to.ol]{githubify_images}}
#' does the work of identifying a local image link and replacing it with the expected
#' location on GitHub.
#' @examples
#' \dontrun{
#' if(interactive()){
#'  setup_environ(devto = "mysecretkey", github_user = "MyName", github_repo = "dev.to-posts")
#'  }
#' }
#' @seealso
#'  \code{\link[glue]{glue}}
#' @rdname setup_environ
#' @export
#' @importFrom glue glue
setup_environ <-
  function(devto,
           github_user,
           github_repo,
           github_branch = "main",
           local_image_path = getwd()) {
    environ_string <-
      glue::glue(
        'DEVTO="{devto}"\nLOCAL_IMAGE_PATH="{local_image_path}"\nGITHUB_USER="{github_user}"\nGITHUB_REPO="{github_repo}"\nGITHUB_BRANCH="{github_branch}"'
      )

    cat(environ_string, file = '.Renviron')
  }
