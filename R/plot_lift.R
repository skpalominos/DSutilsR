#' @title get_lift
#' @description Genera los valores dela lift por percentil
#' @param df Dataset obtenido con get lift
#' @param percentiles Pecentiles a dibujar
#' @param test Indica si la lift graficada proviene de un dataset de test
#' @export
#' @import ggplot2
#' @import data.table
#' @import dplyr
#'

plot_lift <- function(df,percentiles=c(5,10,15),test='yes'){
  if (test=='yes'){
    df <- df %>% mutate(group="Test") %>% setnames(old="cum_lift",new="Value")
  }
  per_values <- df[df$percentil_pred %in% percentiles,]
  per_values <- per_values %>% mutate(Value=round(Value,3))

  plot <- (df %>%
    ggplot(aes(x = percentil_pred, y = Value))+
    geom_line(aes(color = group), size=2) +
    geom_point(data = per_values) +
    geom_segment(data = per_values,
                 aes(xend = percentil_pred, yend = 0),
                 linetype = "dashed") +
    geom_text(data = per_values,
              aes(label = Value),
              vjust = -1) +
    labs(title = "Curva de Lift Acumulada") +
    scale_color_discrete(name = "Percentil",
                         labels = unique(df$group)) +
    coord_cartesian(clip = "off") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1),
          plot.title = element_text(hjust = 0.5)))
  return(plot)

}


