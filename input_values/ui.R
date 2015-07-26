library(shiny)

shinyUI(fluidPage(
    headerPanel("Raw UI values available in server.R"),
    sidebarLayout(
        sidebarPanel(
            actionButton(inputId = "ab.val", label = "PressMe"),
            hr(),

            checkboxGroupInput(inputId = "cgi.val", label = "Checkboxes4all",
                               choices = c(apples = "hello Adam", bananas = "go bananas",
                                           carrot = "what's up doc", dick = "the high commander"),
                               selected = "go bananas"),

            dateInput(inputId = "date.val", label = "Datum", value = "2015-07-26", min = "2015-01-01",
                      max = "2015-12-31"),

            dateRangeInput(inputId = "dr.val", label = "Date Range", start = "2015-07-26",
                           end = "2015-07-31", min = "2015-01-01", max = "2015-12-31"),
            fileInput(inputId = "file.val", label = "Upload file"),

            numericInput(inputId = "num.val", label = "Numeric input", value = 42, min = 0, max = 100, step = 2),
            radioButtons(inputId = "rad.val", label = "Radio buttns",
                         choices = c(button1 = "button1", button2 = "button2", button3 = "button3")),

            selectInput(inputId = "sel.val", label = "Select input", choices = c("Tom", "Dick", "Hairy (no mistake)"),
                        selected = "Tom", multiple = TRUE),

            sliderInput(inputId = "slide.val", label = "Slide", min = 0, max = 100, value = 50, step = 2,
                        animate = TRUE),

            sliderInput(inputId = "slide.range.val", label = "Slide", min = 0, max = 100, value = c(25, 75),
                        step = 2),

            textInput(inputId = "text.val", label = "Text input", value = "Enter text here")
        ),

        mainPanel(
            HTML("Based on <a href='https://gist.github.com/ChrisBeeley/6571951'>Chris Beeley's gist</a>,
                 I decided to create a version where output can be seen more verbatim (not just class)."),
            h4("Action button output"),
            verbatimTextOutput("ab.out"),
            h4("Checkbox4all output"),
            verbatimTextOutput("cgi.out"),
            h4("Date input output"),
            verbatimTextOutput("date.out"),
            h4("Date range output"),
            verbatimTextOutput("dr.out"),
            h4("File output"),
            verbatimTextOutput("file.out"),
            h4("Numeric output"),
            verbatimTextOutput("num.out"),
            h4("Radio button output"),
            verbatimTextOutput("rad.out"),
            h4("Select output"),
            verbatimTextOutput("sel.out"),
            h4("Slide output"),
            verbatimTextOutput("slide.out"),
            h4("Slide range output"),
            verbatimTextOutput("slide.range.out"),
            h4("Text output"),
            verbatimTextOutput("text.out")
        )
    )
))
