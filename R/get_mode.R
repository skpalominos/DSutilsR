#' @title get_mode
#' @description Calcula la moda de una variable categorica
#' @param x Vector de factores
#' @param per Puede tomar los valores NO-> entregara solo la moda, SI-> entrega la proporcion de la categoria, BOTH-> entrega ambas
#' @export
#'

get_mode <- function(x,per='BOTH'){
  out <- NULL
  cat <- unique(x)
  out$moda <- cat[which.max(tabulate(match(x,cat)))]
  out$moda_percentaje <- round(sum(x==out$moda)/length(x),3)
  if (per=='NO') {
    return(out$moda)
  } else if (per=='SI') {
    return(out$moda_percentaje)
  } else {
    return(out)
  }
}

