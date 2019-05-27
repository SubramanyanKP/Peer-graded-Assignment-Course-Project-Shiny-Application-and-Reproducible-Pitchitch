#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
  
  output$table <- renderDataTable({
    car_data <- transmute(mtcars, Car = rownames(mtcars), MilesPerGallon = mpg, 
                      CostofGasoline = input$dis/mpg*input$cost,
                      Cylinders = cyl, Transmission = am)
    car_data <- filter(car_data, Cylinders %in% input$cyl, 
                   Transmission %in% input$am)
    car_data <- mutate(car_data, Transmission = ifelse(Transmission==0, "Automatic", "Manual"))
    car_data <- arrange(car_data, CostofGasoline)
    car_data
  }, options = list(lengthMenu = c(8, 16, 40), pageLength = 40))
})