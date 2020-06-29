#' @title Get the authenticated users unpublished articles
#' @description Provides lots of info on your users unpublished articles
#' @param key the api key you have set up on DEV.TO, Default: NA
#' @param tidy if the response should be parsed into a tibble, Default: TRUE
#' @return article stuff
#' @details If no \code{key} is supplied, will check for key named DEVTO in `.Renviron`. If \code{tidy} is \code{FALSE}, then the full, raw response is returned. Returns both published and unpublished articles, in 2 consecutive calls. Use the `unpublished` variant to get unpublished articles from a different endpoint.
#' @examples
#' \dontrun{
#' if(interactive()){
#'  get_users_articles("my_api_key")
#'  get_users_unpublished_articles("my_api_key")
#'  }
#' }
#' @seealso
#'  \code{\link[httr]{GET}},\code{\link[httr]{add_headers}},\code{\link[httr]{content}}
#'  \code{\link[tibble]{tibble}}
#'  \code{\link[tidyr]{hoist}}
#' @rdname get_users_unpublished_articles
#' @export
#' @importFrom httr GET add_headers content
#' @importFrom tibble tibble
#' @importFrom tidyr unnest_wider
get_users_unpublished_articles <- function(key = NA, tidy = TRUE) {
  check_internet()

  response_unpublished <-
    httr::GET(url = "https://dev.to/api/articles/me/unpublished",
              httr::add_headers("api-key" = api_key(key = key)),
              user_agent)

  check_json(response_unpublished)

  check_status(response_unpublished, 200)

  if (tidy) {
    response_unpublished %>%
      httr::content() %>%
      tibble::tibble(articles = .) %>%
      tidyr::unnest_wider(articles)
  } else {
    response_unpublished
  }
}
