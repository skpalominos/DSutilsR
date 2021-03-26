#' @title eval_binary_performance
#' @description Calcula metricas de performance de un modelo de clasificacion binaria
#' @param Y Vector de valores reales
#' @param pred Vector de predicciones
#' @export
#' @import dplyr
#' @import purrr
#' @import ggplot2
#'

eval_binary_performance <- function(Y,pred){
  res <- NULL
  res$M_conf <- ModelMetrics::confusionMatrix(Y,pred)
  res$auc <- ModelMetrics::auc(Y,pred) %>% as.numeric()
  res$tpr <- ModelMetrics::tpr(Y,pred) %>% as.numeric()
  res$ks <- InformationValue::ks_stat(Y,pred) %>% as.numeric()

  ### Graficas ----------------------------------------------------------------

  #ks
  res$plot_ks <- InformationValue::ks_plot(Y,pred)+ggtitle("KS Plot")
  res$plot_roc <- ROCit::rocit(score=pred,class=Y)

  #plot lift
  df <- get_lift(pred,Y)
  res$plot_lift <- plot_lift(df)

  # Confusion Matriz por threshold
  get_confusion <- function(Y,pred,.x){
    M <- ModelMetrics::confusionMatrix(Y,pred,.x)
    colnames(M) <- c("real 0","real 1")
    rownames(M) <- c("pred 0","pred 1")
    M
  }
  res$M_conf_threshold <- purrr::map(seq(0.1,0.9,0.1),~get_confusion(Y,pred,.x))
  names(res$M_conf_threshold) <- paste("threshold",seq(0.1,0.9,0.1))
  res
}





