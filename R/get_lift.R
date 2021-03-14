#' @title get_lift
#' @description Genera los valores dela lift por percentil
#' @param pred Predicciones
#' @param Y Target
#' @param groups Cantidad de grupos
#' @export
#' @import data.table
#' @import dplyr
#'
get_lift <- function(pred,Y,groups=100){
  df <- data.frame(pred,Y) %>% data.table()
  df <- df[order(-pred)]
  df[,percentil_pred:=cut(rank(pred,ties.method = "first"),groups,groups:1)]
  df <- df[,.(min_pred=min(pred),max_pred=max(pred),mean_pred=mean(pred),Y_mean=mean(Y),sum_Y=sum(Y),freq=.N),by="percentil_pred"] %>% data.table()
  df[,c("lift","percentil_pred"):=.(Y_mean/mean(Y),percentil_pred %>% as.character() %>% as.numeric())]
  df[,cum_lift:=((cumsum(sum_Y)/cumsum(freq))/mean(Y))]
  df <- df[order(percentil_pred)]
  df
}
