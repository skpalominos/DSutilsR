#' @title eval_binary_performance
#' @description Calcula metricas de performance de un modelo de clasificacion binaria
#' @param Y Vector de valores reales
#' @param pred Vector de predicciones
#' @param text Titulo general de las graficas
#' @export
#' @import dplyr
#' @import purrr
#' @import ggplot2
#'

eval_binary_performance <- function(Y,pred,text){
  res <- NULL
  res$M_conf <- ModelMetrics::confusionMatrix(Y,pred)
  res$auc <- ModelMetrics::auc(Y,pred) %>% as.numeric()
  res$tpr <- ModelMetrics::tpr(Y,pred) %>% as.numeric()
  res$ks <- InformationValue::ks_stat(Y,pred) %>% as.numeric()

  ### Graficas ----------------------------------------------------------------

  #ks y roc
  res$plot_ks <- InformationValue::ks_plot(Y,pred)+ggtitle(paste0("KS ",text))
  res$plot_roc <- ROCit::rocit(score=pred,class=Y)

  # Confusion Matriz por threshold
  res$M_conf_threshold <- purrr::map(seq(0.1,0.9,0.1),~ModelMetrics::confusionMatrix(Y,pred,.x))
  res
}





