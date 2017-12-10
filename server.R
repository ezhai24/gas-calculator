library(dplyr)

shinyServer(function(input, output, session) {
  observe({
    df <- data.frame(
      dest = c("Western", "UO", "OSU", "Central", "Eastern", "Gonzaga", "WSU", "Boise State", "Missoula"),
      dist = c(84.5, 296, 269, 111, 269, 284, 288, 500, 478),
      price = c(2.96, 2.89, 2.89, 2.96, 2.96, 2.96, 2.96, 2.71, 2.72)
    )
    
    distance <- df %>%
      filter(dest == input$destination) %>%
      select(dist)
    
    price <- df %>%
      filter(dest == input$destination) %>%
      select(price)
    
    updateNumericInput(session, "dist", value = as.numeric(distance))
    updateNumericInput(session, "avg.price", value = as.numeric(price))
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