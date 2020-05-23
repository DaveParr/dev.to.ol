#' @title Get the api key for the header
#' @description either use the one that is supplied, or find it from the .Renviron
#' @param key Users api key, Default: NA
#' @return Character string of the users api key.
#' @details Will return the character string given, if given. If none is supplied, will look for it as environmental variable.
#' @examples
#' \dontrun{
#' if(interactive()){
#'   api_key
#'  }
#' }
#' @rdname api_key
#' @export
api_key <- function(key = NA) {
  if (!is.na(key)) {
    key
  } else {
    message("Using DEVTO in .Renviron")
    Sys.getenv(x = "DEVTO")
  }
}
