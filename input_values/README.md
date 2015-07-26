When starting with Shiny, user may not have the best idea how to call values from UI to server for processing. This showcase was designed with intent to help these users get a better grasp of calling values without constructing small, reproducible examples every time they want to use something "new". This was built upon [Chris Beeley's](https://github.com/ChrisBeeley) idea presented in a [gist](https://gist.github.com/ChrisBeeley/6571951). A more comprehensive version has already been implemented in [Widget Gallery](http://shiny.rstudio.com/gallery/widget-gallery.html). Hopefully a short version of the input structure will be added to the widget documentation.

You can run this (or any Shiny app on GitHub) app using

```r
library(shiny)
runGitHub("romunov/shinyapps", subdir = "input_values")
```