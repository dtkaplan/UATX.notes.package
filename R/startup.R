

#' All the initialization goes into the function.
#' 
#' Initialize the document for STM1001_W2025 
STM1001_W2025_init <- function(force = FALSE) {
  # Whether to run this: only once per document or session
  # if (force) init_flag_ <<- TRUE
  # else if (init_flag_) return() # take no action
  
  .default_calendar_ <<- readr::read_csv(
    system.file("STM1001_W2025.csv", 
    package = "UATX.notes.package",
    mustWork = TRUE))
  .textbook_site_ <<- "https://www.mosaic-web.org/MOSAIC-Calculus/"
  .devoirs_google_form_ <<- "https://docs.google.com/forms/d/e/1FAIpQLSevJgyHTRHm6_HVQqrYMd8wjMYifPknPLXtpVTunlWlO7RbMw/viewform?usp=pp_url"
  
  # Attach appropriate libraries
  library(devoirs)
  library(mosaicCalc)
  if(!require(UATX.notes.package)) stop("Authors must install the UATX.notes.package.")
  
}
