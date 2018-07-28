#' ggsom_line
#'
#' Visualization that is contains amount of neuron per grid with color based on classes
#'
#' @import ggplot2
#'
#' @import ggthemes
#'
#' @param aes_som Function aes_som for input data on plot
#'
#' @param color Boolean to change color of the edges
#'
#' @examples
#'
#' library(ggthemes)
#' library(ggsom)
#' library(ggplot2)
#' library(kohonen)
#'
#' iris_som <- som(scale(iris[1:4]), grid = somgrid(6, 4, 'rectangular'))
#'
#' ggsom_line(aes_som(iris_som), TRUE)
#'
#' @return ggplot visualization
#'
#' @export
ggsom_line <- function(aes_som, color) {
  aes_color(color, aes_som) +
    geom_line() +
    geom_point() +
    facet_grid(aes_som$y ~ aes_som$x) +
    geom_text(aes(
      y = y,
      x = x,
      label = sum
    ),
    x = 2.5,
    y = 3) + theme_base() + theme(
      strip.background = element_blank(),
      strip.text = element_blank(),
      legend.position = "none",
      axis.title = element_blank(),
      axis.text = element_blank(),
      axis.ticks = element_blank()
    )
}


