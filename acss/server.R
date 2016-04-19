require(acss)
acss("00") 

shinyServer(
  function(input, output) {
    output$text1 <- renderTable({
      input$action
      isolate({
        x <- do.call(input$funct, args = list(string = unlist(strsplit(input$string, " ")), 
                                              alphabet = as.numeric(input$alphabet)))
        if (!is.matrix(x)) {
          x <- as.matrix(x)
          colnames(x) <- paste0(input$funct, ": ", input$alphabet)
        }
      })
      x
    }, digits = 16)
  }
)