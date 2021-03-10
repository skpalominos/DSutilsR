#' @title id_mes_to_period
#' @description Transforma una fecha %Y%m a %Y-%m-01
#' @param idmes Fecha en formato %Y%m
#' @export
#' @import stringr
#'
id_mes_to_period <- function(idmes){
  paste0(str_sub(idmes,1,4),'-',str_sub(idmes,5,6),'-01') %>% as.Date()
}
