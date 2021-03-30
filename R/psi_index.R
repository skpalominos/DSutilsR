#' @title psi_index
#' @description Calcula el indice psi
#' @param cat_test nombre grupo de test
#' @param cat_train nombre grupo de train
#' @param base dataset
#' @param var_cont nombre de la variable continua a analizar
#' @param group_var variable que contiene los grupos
#' @export
#' @import tidyverse
#'
psi_index <- function(cat_test,cat_train,base,var_cont,group_var){

  code <- function(cat_test,cat_train,base,var_cont,group_var){
    base <- base %>% select(var_cont,group_var)
    cut_point <- eval(parse(text={paste0("(base %>% dplyr::filter(",group_var,"=='",cat_test,"') %>% select(all_of(var_cont)))[,1] ")}))
    cut_point <- cut_point %>% unlist() %>% as.vector() %>% na.omit()
    cut_point <- c(cut_point %>% quantile(probs = seq(0,1,0.2)) %>% as.vector())
    test <- (base %>% dplyr::filter(get(group_var)==cat_test) %>% select(var_cont))[,1]
    test <- test %>% unlist() %>% as.vector() %>% na.omit()
    test <- table(cut(test,breaks=cut_point,include.lowest=T,labels=paste0("l",seq(1,5,1))))
    train <- (base %>% dplyr::filter(get(group_var)==cat_train) %>% select(var_cont))[,1]
    train <- table(cut(test,breaks=cut_point,include.lowest=T,labels=paste0("l",seq(1,5,1))))
    x <- log(test/train)
    x[x %in% c(Inf,-Inf)] <- 0
    return(sum(x) %>% round(3))
  }

  out <- tryCatch(expr={code(cat_test,cat_train,base,var_cont,group_var)},error= {function(e) return(NA)})
  return(out)
}
