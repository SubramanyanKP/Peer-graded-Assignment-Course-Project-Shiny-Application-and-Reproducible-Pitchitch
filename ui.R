#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("Calculating cost of gasoline over some distance using data from mtcars"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Provide the distance you have traveled:"),
      numericInput('dis', 'Distance (in miles):', 50, min = 1, max = 100000),
      numericInput('cost', 'Gasoline Price ($ per gallon):', 2.523),
      checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
      checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
    ),
    mainPanel(
      dataTableOutput('table')
    )
  )
))