#' @title analisis_estabilidad_html
#' @description Analisis de estabilidad
#' @param base Nombre de base de datos a analizar.
#' @param group_var Variable por la cual se prentende agrupar
#' @param cont_vars Nombre variables continuas
#' @param cat_train Nombres grupo train
#' @param name Nombre archivo a generar, este argumento debe ser entregado en formato:
#'     "nombre.pdf"
#' @param direc Directorio donde se almacena el archivo a generar.
#' @export
#' @import dplyr
#' @import gridExtra
#' @import stringr
#' @import stats
#' @import kableExtra
#' @import data.table

analisis_estabilidad_html <-function(base,group_var,cont_vars,cat_train,name,direc){

  file_name <-  system.file('rmd','analisis_estabilidad.Rmd',package = "DSutilsR")
  tryCatch({rmarkdown::render(input=file_name,output_file=name,output_dir=direc)},
           error = function(cond){print("error")})
}

