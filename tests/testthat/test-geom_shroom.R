test_that("geom_shroom returns a ggplot2 layer for a fixed icon", {
  layer <- geom_shroom(image = "amanita")

  expect_s3_class(layer, "Layer")
})

test_that("geom_shroom errors clearly for an unknown icon", {
  expect_error(
    geom_shroom(image = "not_a_real_shroom"),
    "Unknown shroom icon"
  )
  expect_error(
    geom_shroom(image = "not_a_real_shroom"),
    "not_a_real_shroom"
  )
  expect_error(
    geom_shroom(image = "not_a_real_shroom"),
    "Available icons"
  )
})

test_that("geom_shroom can build a mapped plot", {
  df <- data.frame(
    x = c(1, 2),
    y = c(1, 2),
    shroom = c("amanita", "morel")
  )

  p <- ggplot2::ggplot(df, ggplot2::aes(x, y)) +
    geom_shroom(ggplot2::aes(image = shroom), size = 0.08)

  expect_silent(ggplot2::ggplot_build(p))
})
