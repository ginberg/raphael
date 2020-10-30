#' Initiate a raphael.
#'
#' Initiate a raphael graph.
#'
#' @param data data.frame containing data to plot.
#' @param x variable column.
#' @param y variable column.
#' @param width,height dimensions of chart.
#' @param elementId id of div containing chart.
#'
#' @examples
#' library(dplyr)
#' library(tibble)
#'
#' mtcars %>% rownames_to_column("names") %>% raphael(x = names, y = carb, type = "pie")
#'
#' @import htmlwidgets
#'
#' @name raphael
#' @rdname raphael
#'
#' @importFrom methods is
#'
#' @export
raphael <- function(data, x, y, type = "pie", width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    data   = data,
    labels = data[[deparse(substitute(x))]],
    values = data[[deparse(substitute(y))]],
    type   = type
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'raphael',
    x,
    width = width,
    height = height,
    package = 'raphael',
    elementId = elementId
  )
}

#' Shiny bindings for raphael
#'
#' Output and render functions for using raphael within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a raphael
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name raphael-shiny
#'
#' @export
raphaelOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'raphael', width, height, package = 'raphael')
}

#' @rdname raphael-shiny
#' @export
renderraphael <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, raphaelOutput, env, quoted = TRUE)
}
