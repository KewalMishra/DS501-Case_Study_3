library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  titlePanel("Titanic Survival Prediction"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Inputs"),
      
      sliderInput("age", "Age:", min = 0, max = 80, value = 30),
      selectInput("sex", "Sex:", c("male" = "male", "female" = "female")),
      selectInput("pclass", "Passenger Class:", c("1" = 1, "2" = 2, "3" = 3)),
      sliderInput("sibsp", "Number of Siblings/Spouses Aboard:", min = 0, max = 8, value = 2),
      sliderInput("parch", "Number of Parents/Children Aboard:", min = 0, max = 6, value = 1),
      numericInput("fare", "Fare:", value = 30),
      actionButton("predict", "Predict")
    ),
    
    mainPanel(
      h3("Prediction Results"),
      h3(uiOutput("prediction_result")),
      p("The plot below shows the distribution of survival predictions based on the input parameters. The red dot represents the current input values."),
      plotOutput("plot"),
      
      h4("About the Model"),
      p("This application uses the Titanic dataset to predict the survival of passengers based on various features. Logistic Regression is used as the algorithm to model the probability of survival."),
      p("You can adjust the input parameters on the left to see how they affect the prediction. The red dot on the plot represents the current input values.")
      
      h3("Data Insights"),
      h4("Survival Distribution"),
      plotOutput("survivalPlot"),
      
      h4("Age Distribution by Survival"),
      plotOutput("agePlot"),
      
      h4("Class Distribution by Survival"),
      plotOutput("classPlot"),
      
      h4("Model Performance"),
      verbatimTextOutput("modelSummary")

    )
  )
))
