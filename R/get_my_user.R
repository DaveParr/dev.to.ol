#' @title Get the authenticated user
#' @description Provides information on the authenticated user
#' @param key the api you have set up on DEV.TO, Default: NA
#' @param tidy if the response should be parsed into a tibble, Default: TRUE
#' @return user stuff
#' @details if no key is supplied, will check for key named DEVTO in `.Renviron`
#' @examples
#' \dontrun{
#' if(interactive()){
#'  get_my_user("my_api_key")
#'  }
#' }
#' @seealso
#'  \code{\link[httr]{GET}},\code{\link[httr]{add_headers}},\code{\link[httr]{content}}
#'  \code{\link[tibble]{tibble}}
#'  \code{\link[dplyr]{select}}
#' @rdname get_my_user
#' @export
#' @importFrom httr GET add_headers content
#' @importFrom tibble tibble
#' @importFrom dplyr select
get_my_user <- function(key = NA, tidy = TRUE) {

  check_internet()

  response <- httr::GET(url = "https://dev.to/api/users/me",
            httr::add_headers("api-key" = api_key(key = key)),
            user_agent)

  check_json(response)

  check_status(response, operation = "getUserArticles", expected = 200)

  if (tidy) {
    response %>%
      httr::content() %>%
      tibble::tibble(key = names(.), value = as.character(.)) %>%
      dplyr::select(key, value)
  } else {
    response
  }
}
