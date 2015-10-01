
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(leaflet)

ti <- read.table("./data/random_pts.txt", header = TRUE)

bootstrapPage(
    tags$style(type = "text/css", "html, body {width:100%;height:100%}"),
    leafletOutput("map", width = "100%", height = "100%"),
    absolutePanel(top = 10, right = 10,
                  selectInput(inputId = "select_lovisce", label = "Izberi lovišče", choices = levels(ti$group),
                              multiple = TRUE))
    )
