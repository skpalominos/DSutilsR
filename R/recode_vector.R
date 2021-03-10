#' @title recode_vector
#' @description Elimina caracteres extraños y espacios en blanco en un vector de strings
#' @param vect Vector
#' @export
#' @import dplyr
#' @import stringr
#'
recode_vector <- function(vect){
  vect %>% str_replace_all("/","") %>%  str_squish() %>% str_replace_all( "[^[:alnum:]]", "_") %>%
    str_replace_all(" ","_") %>% str_replace_all("-","_") %>% str_to_lower()
}
