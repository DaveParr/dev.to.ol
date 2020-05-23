#' @title Get the authenticated user
#' @description Provides information on the authenticated user
#' @param key the api you have set up on DEV.TO, Default: NA
#' @return user stuff
#' @details if no key is supplied, will check for key named DEVTO in `.Renviron`
#' @examples
#' \dontrun{
#' if(interactive()){
#'  get_my_user("my_api_key")
#'  }
#' }
#' @seealso
#'  \code{\link[httr]{content}},\code{\link[httr]{GET}},\code{\link[httr]{add_headers}}
#'  \code{\link[dev.to.ol]{api_key}}
#' @rdname get_my_user
#' @export
#' @importFrom httr content GET add_headers
get_my_user <- function(key = NA) {
  httr::content(httr::GET(url = "https://dev.to/api/users/me",
                          httr::add_headers("api-key" = api_key(key = key))))
}
