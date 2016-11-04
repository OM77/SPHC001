
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)


shinyServer(function(input, output) {
  
  source("global.R", local=TRUE)
  
  output$client.buys.rnd <- renderUI({
    choices <- as.character(g.ccy[g.ccy$name == input$ccy, c("base", "quote")])
    radioButtons(inputId="client.buys", label="Client Buys", choices=choices, selected=NULL, inline=TRUE, width=NULL)
  })
  
  output$notional.ccy.rnd <- renderUI({
    choices <- as.character(g.ccy[g.ccy$name == input$ccy, c("base", "quote")])
    radioButtons(inputId="notional.ccy", label="Notional Ccy", choices=choices, selected=NULL, inline=TRUE, width=NULL)
  })
  
  # output$client.buys.rnd <- renderUI({
  #   choices <- as.character(g.ccy[g.ccy$name == input$ccy, c("base", "quote")])
  #   selectInput(inputId="client.buys", label="Client Buys", choices=choices)
  # })
  
  # output$notional.ccy.rnd <- renderUI({
  #   choices <- as.character(g.ccy[g.ccy$name == input$ccy, c("base", "quote")])
  #   selectInput(inputId="notional.ccy", label="Notional Ccy", choices=choices)
  # })
  
  output$expiry1.rnd <- renderUI({
    if(as.numeric(input$strip.occurrences) <= 1)
    {
      return(dateInput(inputId="expiry1", label="Expiry 1", value=NULL, format="dd-M-yyyy", weekstart=1, startview="month"))
    }
  })
  
  output$notional1.rnd <- renderUI({
    if(as.numeric(input$strip.occurrences) <= 1)
    {
      return(numericInput(inputId="notional1", label="Notional 1", value=NULL, min=100, max=10^7, step=0.01, width=NULL))
    }
  })
  
  output$ratio.rnd <- renderUI({
    sp <- g.sp[g.sp$name == input$sp, ]
    if(sp$ratio)
      return(numericInput(inputId="ratio.amount", label="Ratio Amount", value=NULL, min=100, max=10^7, step=0.01, width=NULL))
  })
  
  output$par1.ni <- renderUI({
    sp <- g.sp[g.sp$name == input$sp, ]
    if(sp$code == "RKIKOF")
    {
      v <- as.numeric(g.ccy[g.ccy$name == input$ccy, c("low", "high", "b.digits")])
      return(numericInput(inputId="init.strike", label="Initial Strike / Barrier", value=NULL, min=v[1], max=v[2], step=1/(10^v[3]), width=NULL))
    } else {
      v <- as.numeric(g.ccy[g.ccy$name == input$ccy, c("low", "high", "s.digits")])
      return(numericInput(inputId="strike", label="Strike Rate", value=NULL, min=v[1], max=v[2], step=1/(10^v[3]), width=NULL))
    }
  })
  
  output$par1.vt <- renderUI({
    sp <- g.sp[g.sp$name == input$sp, ]
    if(sp$code == "RKIKOF")
    {
      return(verbatimTextOutput(outputId="init.strike.inv"))
    } else {
      return(verbatimTextOutput(outputId="strike.inv"))
    }
  })
  
  
  output$par2.ni <- renderUI({
    sp <- g.sp[g.sp$name == input$sp, ]
    if(sp$code == "RKIKOF")
    {
      v <- as.numeric(g.ccy[g.ccy$name == input$ccy, c("low", "high", "s.digits")])
      return(numericInput(inputId="post.strike", label="Post Barrier Strike", value=NULL, min=v[1], max=v[2], step=1/(10^v[3]), width=NULL))
    }
    if(sp$reduction)
    {
      v <- as.numeric(g.ccy[g.ccy$name == input$ccy, c("low", "high", "s.digits")])
      return(numericInput(inputId="reduction", label="Reduction Rate", value=NULL, min=v[1], max=v[2], step=1/(10^v[3]), width=NULL))
    }
    if(sp$barrier)
    {
      v <- as.numeric(g.ccy[g.ccy$name == input$ccy, c("low", "high", "b.digits")])
      return(numericInput(inputId="barrier", label="Barrier Rate", value=NULL, min=v[1], max=v[2], step=1/(10^v[3]), width=NULL))
    }
  })
  
  output$par3.ni <- renderUI({
    sp <- g.sp[g.sp$name == input$sp, ]
    if(sp$code == "RSC")
    {
      v <- as.numeric(g.ccy[g.ccy$name == input$ccy, c("low", "high", "s.digits")])
      return(numericInput(inputId="collar.rate", label="Collar Rate", value=NULL, min=v[1], max=v[2], step=1/(10^v[3]), width=NULL))
    }
    if(sp$reduction & sp$barrier)
    {
      v <- as.numeric(g.ccy[g.ccy$name == input$ccy, c("low", "high", "b.digits")])
      return(numericInput(inputId="barrier", label="Barrier Rate", value=NULL, min=v[1], max=v[2], step=1/(10^v[3]), width=NULL))
    }
  })
  
  
  
  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })
  
  
  
  output$strike.inv <- renderText(round(1/input$strike, g.ccy$s.digits[g.ccy$name == input$ccy]))
  output$init.strike.inv <- renderText(round(1/input$init.strike, g.ccy$b.digits[g.ccy$name == input$ccy]))
  
  

})
