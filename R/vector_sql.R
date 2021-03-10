#' @title vector_sql
#' @description Transforma un vector a sintaxis de vector en SQL
#' @param x Vector
#' @export
#'
vector_sql <- function(x){
  paste0("'",paste(x,collapse="','"),"'")
}
