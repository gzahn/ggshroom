# ggshroom

`ggshroom` is a tiny companion to [`ggimage`](https://github.com/GuangchuangYu/ggimage) that swaps `geom_point()` for fungal and fungus-like image glyphs.

## Usage

```r
library(ggplot2)
library(ggshroom)

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

```r
ggplot(df, aes(x, y)) +
  geom_shroom(image = "yeastbud", size = 0.08) +
  theme_minimal()
```
