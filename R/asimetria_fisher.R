#' @title Coeficiente de Asimetria de Fisher
#' @description Analiza la existencia de una distribucion asimetrica en una variable de tipo
#'    continua.
#' @param x Nombre de la variable.
#' @param interprete Si desea que la funcion entrege interpretacion asignar
#'    'SI' en este parametro, en caso contrario asignar 'NO'.
#' @references Casella, G. (1990). Statistical Inference. Duxburry Press.
#' @export
#' @import stats
#'
asimetria_fisher<-function(x,interprete){
  x<-na.omit(x)
  i<-1
  n<-length(x)
  sx<-sd(x)
  promx<-mean(x)
  a<-0
  while(i<=n){
    a<-a+((x[i]-promx)^3)
    i<-i+1}
  a<-(a/((sx^3)*n))
  if(interprete=='SI'){
    if (a < 0) {print("Asimetria Negativa")}
    else if (a > 0) {print("Asimetria Positiva")}
    else print("Distribucion Simetrica")}
  if(interprete=='NO'){}
  return(a)
}
