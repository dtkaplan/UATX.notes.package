#' Convert session number to date
#' 
.get_calendar_row <- function(calendar, 
                             session) {
  if (is.null(calendar)) stop("Must provide tibble with course calendar. See choices in inst/calendars/")
  today <- calendar |>
    dplyr::filter(session == !!session)
  if (nrow(today) == 0) stop(glue::glue("No class session: {session}"))
  today
}
#' @export
daily_devoirs_id <- function(calendar , 
                             session) {
  today <- .get_calendar_row(calendar, session)
  with(today, glue::glue("daily-s{session}"))
}
#' @export
daily_devoirs_subtitle <- function(calendar , 
                                   session, note = "") {
  today <- .get_calendar_row(calendar, session)
  with(today,
       glue::glue("Daily {session}: due {UATX.notes.package::daily_devoirs_date(calendar, session)} {note}")
  )
}
#' @export
daily_devoirs_date <- function(calendar , 
                               session) {
  today <- .get_calendar_row(calendar, session)
  with(today,
       glue::glue("{dow} {date}"))
}
#' @export
daily_devoirs_link <- function(calendar , 
                               session, note = "") {
  today <- .get_calendar_row(calendar, session)
  with(today,
       glue::glue("[{dow} {date}](Dailies/Session-{session}}.html) {note}")
  )
}
