#' @title Check a file is postable article
#' @description Will check file is readable and extention is .Rmd
#' @param file file path
#' @return TRUE, or FALSE with message
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  is_postable_Rmd("./my/file.Rmd)
#'  attr(is_postable_Rmd("./my/file.Rmd), "msg")
#'  }
#' }
#' @seealso
#'  \code{\link[assertthat]{assert_that}},\code{\link[assertthat]{assertions-file}}
#' @rdname is_postable_Rmd
#' @export
#' @importFrom assertthat see_if is.readable has_extension
is_postable_Rmd <- function(file) {
  assertthat::see_if(
    assertthat::is.readable(file),
    assertthat::has_extension(file, "Rmd")
  )
}
