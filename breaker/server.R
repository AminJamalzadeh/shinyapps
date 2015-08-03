
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  initial.ok <- 0
  
  part1 <- reactive({
    nr.f <- floor(input$num.rows/2)
    out1 <- data.frame(col = sample(letters[1:5], size = nr.f, 
                                    replace = TRUE), 
                       val = runif(nr.f))
    out1
  })
  
  part2 <- reactive({
    
    nr.c <- ceiling(input$num.rows/2)
    out2 <- data.frame(col = sample(letters[1:5], size = nr.c, 
                                    replace = TRUE),
                       val = runif(nr.c))
    out2
  })
  
  output$result <- renderPrint({

    out1 <- part1()
    
    if (initial.ok < input$ok) {
      initial.ok <<- initial.ok + 1
      stop("Interrupted")
    }
    
    out2 <- part2()
    out <- rbind(out1, out2)
    
    print("Successful calculation")
    print(str(out))
  })
})
