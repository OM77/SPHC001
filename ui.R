
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("SP Hedge Calculator"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      
      fluidRow(
        column(6, selectInput(inputId="sp", label="Structured Product", choices=g.sp$name, selected=NULL, width=NULL)),
        column(3, selectInput(inputId="ccy", label="Ccy Pair", choices=g.ccy$name, selected=NULL, selectize=TRUE, width=NULL))
      ),
      
      fluidRow(
        column(4,
               numericInput(inputId="strike", label="Strike", value=NULL, min=1/(10^max(g.ccy$s.digits)), step=1/(10^max(g.ccy$s.digits)), width=NULL),
               verbatimTextOutput(outputId="strike.inv")),
        column(3, selectInput(inputId="ccy", label="Ccy Pair", choices=g.ccy$name, selected=NULL, selectize=TRUE, width=NULL))
      ),
      
      
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))
