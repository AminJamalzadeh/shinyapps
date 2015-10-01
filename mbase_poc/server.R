
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(sp)
library(leaflet)

xy <- read.table("./data/random_pts.txt", header = TRUE)
coordinates(xy) <- ~ lng + lat
proj4string(xy) <- CRS("+init=epsg:4238")

lov <- readOGR(dsn = "./spatial", layer = "LOVISCA_ELIMINATED_corr_simp", encoding = "UTF-8", use_iconv = TRUE)
lov <- spTransform(lov, CRS("+init=epsg:4238"))

# calculate number of points inside individual polygon
lov$numpts <- sapply(over(lov, geometry(xy), returnList=TRUE), length)
lov$numpts[lov$numpts == 0] <- NA

lov$cl <- cut(lov$numpts, breaks = c(0, 1, 10, 20, 50, 100, 500))


shinyServer(function(input, output, session) {

    filteredData <- reactive({

        xy$usercol <- 1
        xy$usercol[xy$group %in% input$select_lovisce] <- 2
        xy
    })

    colorpal <- reactive({
        colorFactor(palette = RColorBrewer::brewer.pal("Set1", n = 9)[c(7, 9)], domain = filteredData()$usercol,
                    alpha = FALSE)
    })

    output$map <- renderLeaflet({
        leaflet(filteredData()) %>% addTiles() %>%
            fitBounds(lng1 = ~min(lng), lat1 = ~min(lat), lng2 = ~max(lng), lat2 = ~max(lat))
    })

    observe({
        pal <- colorpal()

        leafletProxy("map", data = filteredData()) %>%
            clearShapes() %>%
            addCircleMarkers(color = "#77777", weight = 2, fillColor = ~pal(usercol), fillOpacity = 1, popup = ~paste(note))
    })
}
)
