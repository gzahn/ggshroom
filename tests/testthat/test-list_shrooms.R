test_that("list_shrooms returns a character vector of bundled icons", {
  shrooms <- list_shrooms()

  expect_type(shrooms, "character")
  expect_true(length(shrooms) > 0)
  expect_setequal(
    shrooms,
    c(
      "amanita",
      "amf",
      "black",
      "blue",
      "brown",
      "chicken",
      "chytrid",
      "enoki",
      "fusarium",
      "morel",
      "neurospora",
      "physarum",
      "purple",
      "rhizopus",
      "schizo",
      "shiitake",
      "white",
      "yeast1",
      "yeastbud"
    )
  )
})

