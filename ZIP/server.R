# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# http://shiny.rstudio.com
library(shiny)
if (!require('gamlss')) install.packages("gamlss")
library(gamlss)
shinyServer(function(input, output) {
 output$distPlot <- renderPlot({
 # generate values of the ZIP distribution based on input$mu from ui.R
 x <- seq(0, input$xmax, 1)
 y <- dZIP(x, mu=input$mu, sigma=input$Prop)
 # draw the histogram with the specified number of bins
 barplot(y, main='Diagrama de barras para las probabilidades',
         xlab='x', ylab=expression(P(X==x)), las=1, col='deepskyblue3',
         inside=T, names.arg = x, ylim=c(0, 1))
 grid()
   })
})
