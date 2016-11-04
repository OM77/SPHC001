
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("CS Structured Products"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      
      fluidRow(
        column(8, selectInput(inputId="sp", label="Structured Product", choices=g.sp$name, selected=NULL, width=NULL)),
        column(4, selectInput(inputId="ccy", label="Ccy Pair", choices=g.ccy$name, selected=NULL, selectize=TRUE, width=NULL))
      ),
      
      fluidRow(
        column(4, uiOutput("client.buys.rnd")),
        column(4, uiOutput("notional.ccy.rnd"))
      ),
      
      radioButtons(inputId="strip.occurrences", label="Strip (Occurrences)", choices=1:6, selected=NULL, inline=TRUE, width=NULL),
      
      
      fluidRow(
        #column(3, uiOutput("client.buys.rnd")),
        column(4, numericInput(inputId="notional.amount", label="Notional Amount", value=NULL, min=100, max=10^7, step=0.01, width=NULL)),
        #column(3, uiOutput("notional.ccy.rnd")),
        column(4, uiOutput("ratio.rnd"))
      ),
      
      fluidRow(
        column(4, uiOutput("par1.ni"), uiOutput("par1.vt")),
        column(4, uiOutput("par2.ni"), uiOutput("par2.vt")),
        column(4, uiOutput("par3.ni"), uiOutput("par3.vt"))
      ),
      
      
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),

    # Show a plot of the generated distribution
    mainPanel(
      
      fluidRow(
        column(uiOutput("expiry1.rnd"),
               uiOutput("expiry2.rnd"),
               uiOutput("expiry3.rnd"),
               uiOutput("expiry4.rnd"),
               uiOutput("expiry5.rnd"),
               uiOutput("expiry6.rnd"), width=2),
        column(uiOutput("notional1.rnd"),
               uiOutput("notional2.rnd"),
               uiOutput("notional3.rnd"),
               uiOutput("notional4.rnd"),
               uiOutput("notional5.rnd"),
               uiOutput("notional6.rnd"), width=2)
      ),
      
      plotOutput("distPlot")
    )
  )
))
