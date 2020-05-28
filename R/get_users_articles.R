#' @title Get the authenticated users articles
#' @description Provides lots of info on your users articles
#' @param key the api you have set up on DEV.TO, Default: NA
#' @return article stuff
#' @details if no key is supplied, will check for key named DEVTO in `.Renviron`
#' @examples
#' \dontrun{
#' if(interactive()){
#'  get_users_articles("my_api_key")
#'  }
#' }
#' @seealso
#'  \code{\link[httr]{content}},\code{\link[httr]{GET}},\code{\link[httr]{add_headers}},
#'  \code{\link[dev.to.ol]{api_key}}
#' @rdname get_users_articles
#' @export
#' @importFrom httr content GET add_headers
get_users_articles <- function(key = NA) {
  httr::GET(
    url = "https://dev.to/api/articles/me",
    httr::add_headers("api-key" = api_key(key = key))
  )
}
