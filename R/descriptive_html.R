#' @title descriptive_html
#' @description Genera un informe estadistico que incorpora estadisticos descritivos
#' @param base Nombre de base de datos a analizar.
#' @param group_var Variable por la cual se prentende agrupar
#' @param cont_vars Nombre variables continuas
#' @param cat_vars Nombres variables categoricas
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

descriptive_html <-function(base,group_var,cont_vars,cat_vars,name,direc){
  tryCatch({
    rmarkdown::render(input="rmarkdown/describe_numerical.Rmd",
                      "html_document",
                      output_file=name,
                      output_dir=direc)
  },
  error = function(cond){
    rmarkdown::render(input="./rmarkdown/describe_numerical.Rmd",
                      "html_document",
                      output_file=name,
                      output_dir=direc)
    NULL
  })
}



