jsfig <- function(id, ...) {
  id <- rlang::expr_text(rlang::ensym(id))
  knitr::asis_output(
    htmltools::htmlPreserve(
      paste0('<canvas id="', id,'"></canvas')
    )
  )
}
