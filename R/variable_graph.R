#' @title Variable Graph
#' @description Genera graficos de boxplot o barras según el tipo de variable
#' @param df Dataset
#' @param var Nombre variable a graficar
#' @export
#' @import ggplot2
#' @import dplyr
#'

variable_graph <- function(df,var){
  if(eval(parse(text=paste0("df$",var))) %>% class()=="numeric"){
    ggplot(df, aes( y=eval(parse(text=var)))) + geom_boxplot(fill="slateblue", alpha=0.2) +
      xlab(var)+ggtitle(paste0("Boxplot ",var))
  } else {
    ggplot(df, aes(x=as.factor(eval(parse(text=var))), fill=as.factor(eval(parse(text=var))))) +
      geom_bar( ) + scale_fill_brewer(palette = "Set2") + theme(legend.position="none") +
      ggtitle("Grafico de barras ") + xlab(var) + ylab("N")
  }
}
