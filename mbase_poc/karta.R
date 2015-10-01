library(rgdal)
library(leaflet)

lov <- readOGR(dsn = "./spatial", layer = "LOVISCA_ELIMINATED_corr_simp", encoding = "UTF-8", use_iconv = TRUE)
lov <- spTransform(lov, CRS("+init=epsg:4238"))

uo <- readOGR(dsn = "./spatial", layer = "OZULI")
proj4string(uo) <- "+proj=tmerc +lat_0=0 +lon_0=15 +k=0.9999 +x_0=500000 +y_0=-5000000 +ellps=bessel +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
uo <- spTransform(uo, proj4string(lov))

xy <- read.table("./data/random_pts.txt", header = TRUE)
coordinates(xy) <- ~ lng + lat
proj4string(xy) <- CRS("+init=epsg:4238")

lov$numpts <- sapply(over(lov, geometry(xy), returnList = TRUE), length)
lov$numpts[lov$numpts == 0] <- NA
lov$cl <- cut(lov$numpts, breaks = c(0, 1, 10, 20, 50, 100, 500))

uo$numpts <- sapply(over(uo, geometry(xy), returnList = TRUE), length)
uo$numpts[uo$numpts == 0] <- NA
uo$cl <- cut(uo$numpts, breaks = c(0, 50, 100, 500, 1000))

out <- leaflet() %>%
    addTiles() %>%
    addCircleMarkers(data = xy, stroke = FALSE, radius = 3, weight = 1, opacity = 1, fillColor = "black") %>%
    addPolygons(data = lov[!is.na(lov$numpts), ],
                stroke = TRUE, color = "black", weight = 1, fillOpacity = 0.5, smoothFactor = 0.5,
                fillColor = ~colorFactor("Blues", domain = lov$cl)(cl),
                label = ~paste(numpts), group = "Lovisce") %>%
    addPolygons(data = uo[!is.na(uo$numpts), ], group = "Upravljavsko obmocje",
                stroke = TRUE, color = "black", weight = 1, fillOpacity = 0.5, smoothFactor = 0.5,
                fillColor = ~colorFactor("Blues", domain = uo$cl)(cl),
                label = ~paste(numpts)) %>%
    addLayersControl(baseGroups = c("Lovisce", "Upravljavsko obmocje"),
                     options = layersControlOptions(collapsed = FALSE))

library(htmlwidgets)
saveWidget(out, file="index.html", selfcontained = FALSE)

