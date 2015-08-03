library(shiny)

shinyUI(fluidPage(

  titlePanel("Interrupting calculation"),

  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "num.rows", 
                  label = "Generate number of rows",
                  min = 1e1,
                  max = 1e7,
                  value = 3e3),
      actionButton(inputId = "ok", label = "Stop computation")
    ),
    mainPanel(
      verbatimTextOutput("result")
    )
  )
))
