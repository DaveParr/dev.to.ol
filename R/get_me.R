#' @title get my articles
#' @description Provides lots of info on your users articles
#' @param api_key the api you have set up
#' @return article stuff
#' @details DETAILS
#' @examples
#' \dontrun{
#' if(interactive()){
#'  get_me("my_api_key")
#'  }
#' }
#' @seealso
#'  \code{\link[httr]{content}},\code{\link[httr]{GET}},\code{\link[httr]{add_headers}}
#' @rdname get_me
#' @export
#' @importFrom httr content GET add_headers

get_me <- function(api_key) {
  httr::content(httr::GET(url = "https://dev.to/api/articles/me",
                          httr::add_headers("api-key" = api_key)))
}
