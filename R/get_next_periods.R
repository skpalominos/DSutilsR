#' @title Get next periods
#' @description Obteniene los siguientes n periodos desde una fecha
#' @param day Fecha
#' @param n Numero de periodos siguientes
#' @export
#' @import lubridate
#'

get_next_periods <- function(day,n){
  day <- ymd(day)
  seq(day,day+months(n),by="months")
}

