.shroom_paths <- function(image) {
  image <- as.character(image)
  available <- list_shrooms()

  out <- rep(NA_character_, length(image))
  is_known <- !is.na(image) & image %in% available
  out[is_known] <- file.path(system.file("extdata", package = "ggshroom"), paste0(image[is_known], ".png"))

  unknown <- unique(image[!is.na(image) & !is_known])
  if (length(unknown) > 0L) {
    stop(
      sprintf(
        "Unknown shroom icon%s: %s. Available icons: %s",
        if (length(unknown) > 1L) "s" else "",
        paste(shQuote(unknown), collapse = ", "),
        paste(available, collapse = ", ")
      ),
      call. = FALSE
    )
  }

  out
}

#' Fungal icon geom for ggplot2
#'
#' `geom_shroom()` is a thin wrapper around [ggimage::geom_image()] that
#' converts bundled icon names like `"amanita"` into package file paths.
#'
#' @inheritParams ggimage::geom_image
#' @param image A bundled shroom icon name. Use [list_shrooms()] to see the
#'   available values.
#' @param show.legend Should this layer be included in the legends? `NA`
#'   includes it if any aesthetics are mapped, `FALSE` never includes it, and
#'   `TRUE` always includes it.
#'
#' @return A ggplot2 layer.
#' @export
geom_shroom <- function(mapping = NULL,
                        data = NULL,
                        stat = "identity",
                        position = "identity",
                        ...,
                        na.rm = FALSE,
                        show.legend = NA,
                        inherit.aes = TRUE,
                        image = NULL,
                        by = "width",
                        nudge_x = 0,
                        use_cache = TRUE) {
  image_fun <- NULL

  if (!is.null(mapping) && "image" %in% names(mapping)) {
    image_fun <- .shroom_paths
  }

  if (!is.null(image)) {
    image <- .shroom_paths(image)
  }

  geom_args <- list(
    mapping = mapping,
    data = data,
    stat = stat,
    position = position,
    inherit.aes = inherit.aes,
    na.rm = na.rm,
    by = by,
    nudge_x = nudge_x,
    use_cache = use_cache,
    ...
  )

  if (!is.null(image)) {
    geom_args$image <- image
  }

  layer <- do.call(ggimage::geom_image, geom_args)

  layer$show.legend <- show.legend

  if (!is.null(image_fun)) {
    layer$geom_params$.fun <- image_fun
  }

  layer
}
