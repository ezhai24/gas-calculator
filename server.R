shinyServer(function(input, output) {
  #gas <- function(mileage) {
  #  gas.price <- 2.99
  #  distance <- 2 * 269
  #  gals <- distance / mileage
  #  return(gals * gas.price)
  #}
  
  output$payment <- renderText({
    validate(
      need(is.numeric(input$dist), 'Please enter a valid numeric value for distance input'),
      need(is.numeric(input$mpg), 'Please enter a valid numeric value for mileage input'),
      need(is.numeric(input$avg.price), 'Please enter a valid numeric value for gas price input')
    )
    gallons.used <- input$dist / input$mpg
    payment <- gallons.used * input$avg.price
    payment
  })
})