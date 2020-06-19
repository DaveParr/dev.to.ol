#' @title Get the authenticated users articles
#' @description Provides lots of info on your users articles
#' @param key the api key you have set up on DEV.TO, Default: NA
#' @param tidy if the response should be parsed into a tibble, Default: TRUE
#' @return article stuff
#' @details If no \code{key} is supplied, will check for key named DEVTO in `.Renviron`. If \code{tidy} is \code{FALSE}, then the full, raw response is returned.
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
#' @importFrom tibble tibble
get_users_articles <- function(key = NA, tidy = TRUE) {

  check_internet()

  response <- httr::GET(url = "https://dev.to/api/articles/me",
                        httr::add_headers("api-key" = api_key(key = key)),
                        user_agent)

  check_json(response)

  check_status(response, 200)

  if (tidy) {
    response %>%
      content() %>%
      tibble::tibble(articles = .) %>%
      tidyr::unnest_wider(articles)
  } else {
    response
  }
}
