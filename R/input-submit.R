#' Create a submit button
#'
#' Create a submit button for an app. Apps that include a submit
#' button do not automatically update their outputs when inputs change,
#' rather they wait until the user explicitly clicks the submit button.
#' The use of \code{submitButton} is generally discouraged in favor of
#' the more versatile \code{\link{actionButton}} (see details below).
#'
#' Submit buttons are unusual Shiny inputs, and we recommend using
#' \code{\link{actionButton}} instead of \code{submitButton} when you
#' want to delay a reaction.
#' See \href{http://shiny.rstudio.com/articles/action-buttons.html}{this
#' article} for more information (including a demo of how to "translate"
#' code using a \code{submitButton} to code using an \code{actionButton}).
#'
#' In essence, the presence of a submit button stops all inputs from
#' sending their values automatically to the server. This means, for
#' instance, that if there are \emph{two} submit buttons in the same app,
#' clicking either one will cause all inputs in the app to send their
#' values to the server. This is probably not what you'd want, which is
#' why submit button are unwieldy for all but the simplest apps. There
#' are other problems with submit buttons: for example, dynamically
#' created submit buttons (for example, with \code{\link{renderUI}}
#' or \code{\link{insertUI}}) will not work.
#'
#' @param text Button caption
#' @param icon Optional \code{\link{icon}} to appear on the button
#' @param width The width of the button, e.g. \code{'400px'}, or \code{'100\%'};
#'   see \code{\link{validateCssUnit}}.
#' @return A submit button that can be added to a UI definition.
#'
#' @family input elements
#'
#' @examples
#' if (interactive()) {
#'
#' shinyApp(
#'   ui = basicPage(
#'     numericInput("num", label = "Make changes", value = 1),
#'     submitButton("Update View", icon("refresh")),
#'     helpText("When you click the button above, you should see",
#'              "the output below update to reflect the value you",
#'              "entered at the top:"),
#'     verbatimTextOutput("value")
#'   ),
#'   server = function(input, output) {
#'
#'     # submit buttons do not have a value of their own,
#'     # they control when the app accesses values of other widgets.
#'     # input$num is the value of the number widget.
#'     output$value <- renderPrint({ input$num })
#'   }
#' )
#' }
#' @export
submitButton <- function(text = "Apply Changes", icon = NULL, width = NULL) {
  div(
    tags$button(
      type="submit",
      class="btn btn-primary",
      style = if (!is.null(width)) paste0("width: ", validateCssUnit(width), ";"),
      list(icon, text)
    )
  )
}
