## Example

Basic example.

```r
library(raphael)
library(dplyr)
library(tibble)

mtcars %>% 
  rownames_to_column("names") %>% 
  arrange(-hp) %>% 
  head(5) %>% 
  raphael(x = names, y = hp, type = "pie")
```


## Get it


The development version from Github.

```r
# install.packages("remotes")
remotes::install_github("ginberg/raphael")
```
