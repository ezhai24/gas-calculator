# import libraries
library(shiny)

# shiny UI
shinyUI(
  fluidPage(
  
    title = "UWWRC Gas Calculator",
    
    h1("Pay Up & Cry", align = "center"),
    h1(textOutput("payment"), align = "center"),
    
    hr(),
    
    fluidRow(
      column(4,
        selectInput(
          "destination",
          "(One way) Distance to...",
          c("Western", "UO", "OSU", "Central", "Eastern",
            "Gonzaga", "WSU", "Boise State", "Missoula")
        ),
        numericInput("dist", "", 1000.1, step = 0.1)
      ),
      
      column(4, numericInput("mpg", "Car Mileage", 22)),
      
      column(4,
        numericInput("avg.price", "Average Gas Price", 2.93, step = 0.01),
        helpText("*Presets for average gas price are the average of the average state gas prices of all
                 of the states driven through on a particular journey. These values are static and true
                 as of December 9, 2017. Please verify and update as necessary.")
      )
    )
  )
)