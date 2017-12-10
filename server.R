library(dplyr)

shinyServer(function(input, output, session) {
  observe({
    distance.df <- data.frame(
      dest = c("Western", "UO", "OSU", "Central", "Eastern", "Gonzaga", "WSU", "Boise State", "Missoula"),
      dist = c(84.5, 296, 269, 111, 269, 284, 288, 500, 478)
    )
    
    distance <- distance.df %>%
      filter(dest == input$destination) %>%
      select(dist)
    
    updateNumericInput(session, "dist", value = as.numeric(distance))
  })
  
  output$payment <- renderText({
    validate(
      need(is.numeric(input$dist), 'Please enter a valid numeric value for distance input'),
      need(is.numeric(input$mpg), 'Please enter a valid numeric value for mileage input'),
      need(is.numeric(input$avg.price), 'Please enter a valid numeric value for gas price input')
    )
    gallons.used <- (input$dist * 2) / input$mpg
    payment <- gallons.used * input$avg.price
    payment
  })
})