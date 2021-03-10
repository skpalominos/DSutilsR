#' @title just_spread
#' @description Genera un spread del dataset
#' @param var_num Nombre variable numerica
#' @param data Nombre dataset
#' @param ids Vector de nombres de ids
#' @param var_cat variable categrica
#' @export
#' @import dplyr
#' @import stringr
#' @import tidyr
#' @import data.table
#'
just_spread <- function(var_num,data,ids,var_cat){
  data <- data %>% select(ids,var_cat,var_num)
  data <- data %>% spread(var_cat,var_num)
  names(data) <- names(data) %>% recode_vector()
  data <- data %>% edit_names(remains=ids,new_format=paste0("_",var_num))
  data
}
