#' @importFrom attempt stop_if_not
#' @importFrom curl has_internet
check_internet <- function() {
  attempt::stop_if_not(.x = curl::has_internet(), msg = "Please check your internet connection")
}

#' @importFrom httr status_code
#' @importFrom glue glue
check_status <- function(response, operation = "", expected = 200) {
  code <- httr::status_code(response)
  attempt::stop_if_not(
    .x = code,
    .p = ~ .x == expected,
    msg = glue::glue("The API returned an error: {code}\nSee https://docs.dev.to/api/#operation/{operation} for error codes", code = code, operation = operation)
  )
  attempt::message_if(
    .x = code,
    .p = ~ .x == expected,
    msg = glue::glue("The API returned the expected success: {code}", code = code)
  )
}

#' @importFrom httr http_type
check_json <- function(response) {
  attempt::stop_if_not(
    .x = httr::http_type(response),
    .p = ~ .x == "application/json",
    msg = "The API did not return json"
  )
}

#' @importFrom httr user_agent
user_agent <- user_agent("https://github.com/DaveParr/dev.to.ol")
