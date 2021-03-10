#' @title est_cont_html
#' @description Genera un informe estadistico que incorpora estadisticos descritivos
#' @param base Nombre de base de datos a analizar.
#' @param var_cat Nombre variable sobre la que se quiere agrupar
#' @param cont_var Nombres variables continuas
#' @param name Nombre archivo a generar, este argumento debe ser entregado en formato:
#'     "nombre.pdf"
#' @param direc Directorio donde se almacena el archivo a generar.
#' @examples
#' \dontrun{
#' data("albahaca")
#' informe.pdf(albahaca,"estadisticos.pdf","C:/Users/usuario/Desktop")}
#' @export
#' @import dplyr
#' @import gridExtra
#' @import ggplot2
#' @import stringr
#' @import stats
#' @import kableExtra
#' @import data.table
#' @import plotly

est_cont_html <-function(base,var_cat,cont_var,name,direc){
  tryCatch({
    rmarkdown::render(input="inst/rmarkdown/describe_numerical.Rmd",
                      "html_document",
                      output_file=name,
                      output_dir=direc)
  },
  error = function(cond){
    rmarkdown::render(input=".//rmarkdown/describe_numerical.Rmd",
                      "html_document",
                      output_file=name,
                      output_dir=direc)
    NULL
  })
}


