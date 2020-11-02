## add.R

#' Pie chart
#'
#' Add a pie chart.
#'
#' @examples
#' library(dplyr)
#' library(tibble)
#'
#' raphael() %>%
#'  r_pie(mtcars %>%
#'          rownames_to_column("names") %>%
#'          arrange(-hp) %>%
#'          head(5),
#'        x = names,
#'        y = hp)
#'
#' @param r A \code{raphael} object as returned by \code{\link{raphael}}
#' @param data data.frame containing data to plot.
#' @param x variable column.
#' @param y variable column.
#'
#' @rdname r_pie
#' @export
r_pie <- function(r, data, x, y) {
  if (missing(r)) {
    stop("must pass r", call. = FALSE)
  }
  if (missing(data)) {
    stop("must pass data", call. = FALSE)
  }
  if (missing(x)) {
    stop("must pass x", call. = FALSE)
  }
  if (missing(y)) {
    stop("must pass y", call. = FALSE)
  }

  r$x <- list(type   = "pie",
              data   = data,
              labels = data[[deparse(substitute(x))]],
              values = data[[deparse(substitute(y))]])
  r
}

#' Image
#'
#' Add an image.
#'
#' @param r A \code{raphael} object as returned by \code{\link{raphael}}
#' @param src the image source
#'
#' @examples
#'
#' raphael() %>%
#'  r_image(src = "https://dmitrybaranovskiy.github.io/raphael/bd.jpg")
#'
#' @rdname r_image
#' @export
r_image <- function(r, src) {
  if (missing(r)) {
    stop("must pass e", call. = FALSE)
  }
  if (missing(src)) {
    stop("must pass src", call. = FALSE)
  }

  r$x <- list(type = "image",
              src = src)
  r
}
