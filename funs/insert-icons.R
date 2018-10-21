# Functions for inserting icons
# ------------------------------------------------------------------------------

# GitHub Octicons
octicon <- function(..., h = 20, w = h) {
  imgs <- list(...)
  img_strs <- lapply(imgs, function(icon) {
    paste0('<img src="imgs/octicons/', icon,
           '.svg" height="', h,
           '" width="', w, '" alt="icon">')
  })
  paste(img_strs, collapse = "")
}
