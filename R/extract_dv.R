#' @title extract_dv
#' @description Elimina el dv de un rut en formato num-dv
#' @param rut Vector de ruts
#' @export
#' @import dplyr
#' @import stringr
#'

extract_dv <- function(rut){
  rut %>% str_remove_all('-') %>% str_sub(0,-2) %>% as.numeric()
}
