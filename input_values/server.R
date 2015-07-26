library(shiny)

shinyServer(function(input, output) {

    output$ab.out <- renderPrint("See http://shiny.rstudio.com/gallery/actionbutton-demo.html how button works")
    output$cgi.out <- renderPrint(str(input$cgi.val))
    output$date.out <- renderPrint(str(input$date.val))
    output$dr.out <- renderPrint(str(input$dr.val))
    output$file.out <- renderPrint(str(input$file.val))
    output$num.out <- renderPrint(str(input$num.val))
    output$rad.out <- renderPrint(str(input$rad.val))
    output$sel.out <- renderPrint(str(input$sel.val))
    output$slide.out <- renderPrint(str(input$slide.val))
    output$slide.range.out <- renderPrint(str(input$slide.range.val))
    output$text.out <- renderPrint(str(input$text.val))

})
