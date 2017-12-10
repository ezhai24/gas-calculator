# import libraries
library(shiny)

# shiny UI
shinyUI(
  fluidPage(
  
    title = "UWWRC Gas Calculator",
    
    h1("Pay Up", align = "center"),
    h1(textOutput("payment"), align = "center"),
    
    hr(),
    
    fluidRow(
      column(4,
        selectInput(
          "destination",
          "Distance to...",
          c("Western", "UO", "OSU", "Central", "Eastern",
            "Gonzaga", "WSU", "Idaho", "Montana")
        ),
        numericInput("dist", "", 1000.1, step = 0.1)
      ),
      
      column(4, numericInput("avg.price", "Average Gas Price", 2.93, step = 0.01)),
      
      column(4, numericInput("mpg", "Car Mileage", 22))
    )
  )
)