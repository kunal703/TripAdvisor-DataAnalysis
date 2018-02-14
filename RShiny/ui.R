library(data.table)
library(lubridate)
library(plotly)
library(shinydashboard)
library(leaflet)

fluidPage(
  titlePanel("Hotels Geographic Distribution"),
  sidebarLayout(position = "left",
                sidebarPanel(
                  
                  selectInput("state", 
                              label = "State",
                              choices = c("AL",
                                          "AK",
                                          "AZ",
                                          "AR",
                                          "CA",
                                          "CO",
                                          "CT",
                                          "DE",
                                          "FL",
                                          "GA",
                                          "HI",
                                          "ID",
                                          "IL",
                                          "IN",
                                          "IA",
                                          "KS",
                                          "KY",
                                          "LA",
                                          "ME",
                                          "MD",
                                          "MA",
                                          "MI",
                                          "MN",
                                          "MS",
                                          "MO",
                                          "MT",
                                          "NE",
                                          "NV",
                                          "NH",
                                          "NJ",
                                          "NM",
                                          "NY",
                                          "NC",
                                          "ND",
                                          "OH",
                                          "OK",
                                          "OR",
                                          "PA",
                                          "RI",
                                          "SC",
                                          "SD",
                                          "TN",
                                          "TX",
                                          "UT",
                                          "VT",
                                          "VA",
                                          "WA",
                                          "WV",
                                          "WI",
                                          "WY"),
                              selected = "NY"),
                  
                  sliderInput("cleanliness_rating",
                              label = "Cleanliness Rating",
                              min = 0,
                              max = 5,
                              value = c(1,5)),
                  
                  sliderInput("service_rating",
                              label = "Service Rating",
                              min = 0,
                              max = 5,
                              value = c(1,5)),
                  
                  sliderInput("rooms_rating",
                              label = "Rooms Rating",
                              min = 0,
                              max = 5,
                              value = c(1,5)),
                  
                  sliderInput("overall_rating",
                              label = "Overall Rating",
                              min = 0,
                              max = 5,
                              value = c(1,5)),
                  
                  sliderInput("price_range",
                              label = "Price Range",
                              min = 0,
                              max = 1000,
                              value = c(200,500)),
                  
                  submitButton("Submit")
                ),
                
                mainPanel(
                  leafletOutput("map", width = "100%", height = "500px")
                )
  )
)