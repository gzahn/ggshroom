# ggshroom

Tiny companion to [`ggimage`](https://github.com/YuLab-SMU/ggimage) for plotting fungal and fungus-like icons in `ggplot2`.

`ggshroom` depends on `ggimage` internally and wraps `ggimage::geom_image()` with a simple fungus-friendly interface.

___

## Installation

```r
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools")
}

devtools::install_github("gzahn/ggshroom")
```

`ggimage` will be installed automatically as a package dependency.

___

## Citation

If you use `ggshroom` in a publication or public project and feel like citing it:

[![DOI](https://zenodo.org/badge/1260597989.svg)](https://doi.org/10.5281/zenodo.20561468)

## Example usage

```r
library(ggplot2)
library(ggshroom)
# ggshroom uses ggimage::geom_image() under the hood

set.seed(1)

df <- data.frame(
  x = rnorm(50),
  y = rnorm(50),
  shroom = sample(list_shrooms(), 50, replace = TRUE)
)

ggplot(df, aes(x, y)) +
  geom_shroom(aes(image = shroom), size = 0.08) +
  theme_minimal()
```

You can also use a single fixed icon:

```r
ggplot(df, aes(x, y)) +
  geom_shroom(image = "yeastbud", size = 0.08) +
  theme_minimal()
```

___

## Available icons

Use `list_shrooms()` to see the bundled icon names, or browse the gallery below.

| Name | Icon |
| --- | --- |
| amanita | <img src="inst/extdata/amanita.png" width="64" alt="amanita" /> |
| amf | <img src="inst/extdata/amf.png" width="64" alt="amf" /> |
| black | <img src="inst/extdata/black.png" width="64" alt="black" /> |
| blue | <img src="inst/extdata/blue.png" width="64" alt="blue" /> |
| brown | <img src="inst/extdata/brown.png" width="64" alt="brown" /> |
| chicken | <img src="inst/extdata/chicken.png" width="64" alt="chicken" /> |
| chytrid | <img src="inst/extdata/chytrid.png" width="64" alt="chytrid" /> |
| enoki | <img src="inst/extdata/enoki.png" width="64" alt="enoki" /> |
| fusarium | <img src="inst/extdata/fusarium.png" width="64" alt="fusarium" /> |
| morel | <img src="inst/extdata/morel.png" width="64" alt="morel" /> |
| neurospora | <img src="inst/extdata/neurospora.png" width="64" alt="neurospora" /> |
| physarum | <img src="inst/extdata/physarum.png" width="64" alt="physarum" /> |
| purple | <img src="inst/extdata/purple.png" width="64" alt="purple" /> |
| rhizopus | <img src="inst/extdata/rhizopus.png" width="64" alt="rhizopus" /> |
| schizo | <img src="inst/extdata/schizo.png" width="64" alt="schizo" /> |
| shiitake | <img src="inst/extdata/shiitake.png" width="64" alt="shiitake" /> |
| white | <img src="inst/extdata/white.png" width="64" alt="white" /> |
| yeast1 | <img src="inst/extdata/yeast1.png" width="64" alt="yeast1" /> |
| yeastbud | <img src="inst/extdata/yeastbud.png" width="64" alt="yeastbud" /> |
