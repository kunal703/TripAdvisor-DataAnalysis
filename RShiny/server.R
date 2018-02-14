library(shiny)
library(data.table)
library(lubridate)
library(plotly)
library(shinydashboard)
library(leaflet)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  df <- fread("hotel_reviews.csv");
  
  output$map <- renderLeaflet({
    
    new_data = filter(df,
                      
                      df$State == input$state &
                        
                        df$`avg(Overall)` >=  input$overall_rating[1] &
                        df$`avg(Overall)` <=  input$overall_rating[2] &
                        
                        df$`avg(Service)` >= input$service_rating[1] &
                        df$`avg(Service)` <= input$service_rating[2] &
                        
                        df$`avg(Cleanliness)` >= input$cleanliness_rating[1] &
                        df$`avg(Cleanliness)` <= input$cleanliness_rating[2] &
                        
                        df$`avg(Rooms)` >= input$rooms_rating[1] &
                        df$`avg(Rooms)` <= input$rooms_rating[2] &
                        
                        df$minPrice >= input$price_range[1] &
                        df$maxPrice <= input$price_range[2]
    )
    
    leaflet(new_data) %>% addTiles() %>%  
      addMarkers(lat=~latitude, lng=~longitude, popup=new_data$Name)
  })
})