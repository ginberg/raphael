## Example

Basic examples.

```r
library(raphael)
library(dplyr)
library(tibble)

# pie chart
raphael() %>%
  r_pie(mtcars %>% 
          rownames_to_column("names") %>% 
          arrange(-hp) %>% 
          head(5),
        x = names, 
        y = hp)
  
# reflected image
raphael() %>%
  r_image(src = "https://dmitrybaranovskiy.github.io/raphael/bd.jpg")
```


## Get it


The development version from Github.

```r
# install.packages("remotes")
remotes::install_github("ginberg/raphael")
```
