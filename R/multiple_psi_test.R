#' @title multiple_test_psi
#' @description Calcula el indice psien multiples grupos de test
#' @param var_cont nombre de la variable continua a analizar
#' @param base dataset
#' @param group_var variable que contiene los grupos
#' @param cat_train nombre grupo de train
#' @export
#' @import dplyr
#' @import purrr

multiple_test_psi <- function(var_cont,base,group_var,cat_train){
  cat_test <- eval(parse(text={paste0("(base %>% dplyr::filter(",group_var,"!='",cat_train,"') %>% select(all_of(group_var)))[,1] %>% unique()")}))
  cat_test <- cat_test %>% unlist() %>% as.vector()
  res <- cat_test %>% purrr::map(~psi_index(.x,cat_train,base,var_cont,group_var)) %>% unlist()
  names(res) <- cat_test
  res
}
