#' List bundled shroom icons
#'
#' Returns the available fungal and fungus-like icon names bundled with the
#' package.
#'
#' @return A character vector of icon names without file extensions.
#' @export
list_shrooms <- function() {
  shroom_dir <- system.file("extdata", package = "ggshroom")
  tools::file_path_sans_ext(list.files(shroom_dir, pattern = "\\.png$", full.names = FALSE))
}

