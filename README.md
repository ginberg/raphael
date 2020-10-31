## Example

Basic examples.

```r
library(raphael)
library(dplyr)
library(tibble)

# pie chart
mtcars %>% 
  rownames_to_column("names") %>% 
  arrange(-hp) %>% 
  head(5) %>% 
  raphael(x = names, y = hp, type = "pie")
  
# reflected image
raphael(type = "image", src = "https://dmitrybaranovskiy.github.io/raphael/bd.jpg")
```


## Get it


The development version from Github.

```r
# install.packages("remotes")
remotes::install_github("ginberg/raphael")
```
