#' @title binary_performance_html
#' @description Genera un informe estadistico que incorpora estadisticos descritivos
#' @param Y Nombre de base de datos a analizar.
#' @param pred Variable por la cual se prentende agrupar
#' @param text Nombre variables continuas
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

binary_performance_html <-function(Y,pred,M,text,name,direc){
  tryCatch({
    rmarkdown::render(input="inst/rmarkdown/metricas_performance_binario.Rmd",
                      "html_document",
                      output_file=name,
                      output_dir=direc)
  },
  error = function(cond){
    rmarkdown::render(input="./rmarkdown/metricas_performance_binario.Rmd",
                      "html_document",
                      output_file=name,
                      output_dir=direc)
    NULL
  })
}