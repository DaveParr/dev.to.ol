library("vcr")
invisible(vcr::vcr_configure(
  dir = "../fixtures",
  filter_sensitive_data = list("<<<my_api_key>>>" = Sys.getenv('DEVTO'))
))
vcr::check_cassette_names()
