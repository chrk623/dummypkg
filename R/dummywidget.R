#' Joining Animation
#'
#' @param col Color of rectangle.
#' @description
#' @examples
#' dummywidget(col = "red")
#' dummywidget(col = "blue")
#' @author Charco Hui
#' @import htmlwidgets
#'
#' @export
dummywidget <- function(col = "red", width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    col = col
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'dummywidget',
    x,
    width = width,
    height = height,
    package = 'dummypkg',
    elementId = elementId
  )
}

#' Shiny bindings for dummywidget
#'
#' Output and render functions for using dummywidget within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a dummywidget
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name dummywidget-shiny
#'
#' @export
dummywidgetOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'dummywidget', width, height, package = 'dummypkg')
}

#' @rdname dummywidget-shiny
#' @export
renderDummywidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, dummywidgetOutput, env, quoted = TRUE)
}
