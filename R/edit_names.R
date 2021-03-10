#' @title edit_names
#' @description Cambia el formato de nombres de variables escogidas
#' @param dataset Nombre dataset
#' @param remains Vector de variables que no se editaran
#' @param new_format Terminacion del nuevo formato de nombres
#' @export

#' @import dplyr
#' @import stringr
#' @import tidyr
#' @import data.table
#'
edit_names <- function(dataset,remains,new_format){
  x <- (dataset %>% ungroup() %>% select(-remains)) %>% names()
  dataset <- dataset %>% setnames(old=x,new=paste0(x,new_format))
  dataset
}
