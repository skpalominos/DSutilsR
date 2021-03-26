#' @title multiple_variable_psi
#' @description Calcula para distintos grupos de test en distintan variables
#' @param cont_vars variables numericas
#' @param base dataset
#' @param group_var variable que contiene los grupos
#' @param cat_train nombre grupo de train
#' @export
#' @import dplyr
#'
multiple_variable_psi <- function(cont_vars,base,group_var,cat_train){
  res <- t(cont_vars %>% purrr::map(~multiple_test_psi(.x,base,group_var,cat_train)) %>% bind_rows()) %>% as.matrix()
  colnames(res) <- cont_vars
  res
}


