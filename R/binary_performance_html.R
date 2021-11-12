#' @title binary_performance_html
#' @description Genera un informe estadistico que incorpora estadisticos descritivos
#' @param Y Nombre de base de datos a analizar.
#' @param pred Variable por la cual se prentende agrupar
#' @param M Objeto con información adicional
#' @param name Nombre archivo a generar, este argumento debe ser entregado en formato:
#'     "nombre.pdf"
#' @param direc Directorio donde se almacena el archivo a generar.
#' @export
#' @import dplyr
#' @import gridExtra
#' @import ggplot2
#' @import stringr
#' @import stats
#' @import kableExtra
#' @import data.table
#' @import plotly
#' @import yardstick

binary_performance_html <-function(Y,pred,M,name,direc){

 file_name <-  system.file('rmd','metricas_performance_binario.Rmd',package = "DSutilsR")
  tryCatch({rmarkdown::render(input=file_name,output_file=name,output_dir=direc)},
           error = function(cond){print("error")})
}
