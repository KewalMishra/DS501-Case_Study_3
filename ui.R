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
      p("You can adjust the input parameters on the left to see how they affect the prediction. The red dot on the plot represents the current input values."),
      
      h3("Data"),
      p("The data used for this project is the Titanic dataset, which is a well-known dataset in the field of data science and machine learning. This dataset contains information about the passengers on the Titanic, including:"),
      tags$ul(
        tags$li("PassengerId: A unique identifier for each passenger."),
        tags$li("Survived: Survival status (0 = No, 1 = Yes)."),
        tags$li("Pclass: Passenger class (1 = 1st, 2 = 2nd, 3 = 3rd)."),
        tags$li("Name: Name of the passenger."),
        tags$li("Sex: Gender of the passenger."),
        tags$li("Age: Age of the passenger."),
        tags$li("SibSp: Number of siblings/spouses aboard the Titanic."),
        tags$li("Parch: Number of parents/children aboard the Titanic."),
        tags$li("Ticket: Ticket number."),
        tags$li("Fare: Amount of money the passenger paid for the ticket."),
        tags$li("Cabin: Cabin number."),
        tags$li("Embarked: Port of embarkation (C = Cherbourg, Q = Queenstown, S = Southampton).")
      ),
      
      h3("Motivation"),
      p("The Titanic disaster is one of the most infamous maritime tragedies in history. The dataset provides a rich set of features that can be used to build predictive models and gain insights into the factors that influenced survival. The motivation behind analyzing this dataset includes:"),
      tags$ul(
        tags$li("Historical Significance: Understanding the factors that influenced survival can provide historical insights."),
        tags$li("Predictive Modeling: It serves as an excellent case study for demonstrating predictive modeling techniques."),
        tags$li("Feature Analysis: Exploring which features had the most impact on survival."),
        tags$li("Educational Value: The dataset is commonly used for educational purposes to teach data analysis and machine learning.")
      ),
      
      h3("Explain the Algorithm"),
      p("The algorithm used for this project is Logistic Regression. Logistic Regression is a statistical method for analyzing a dataset in which there are one or more independent variables that determine an outcome. The outcome is measured with a dichotomous variable (in which there are only two possible outcomes)."),
      
      h3("Mathematical/Statistical Details"),
      p("Logistic Regression works by fitting a logistic function to the data. The logistic function, also known as the sigmoid function, is defined as:"),
      tags$pre("  \\[ \\sigma(x) = \\frac{1}{1 + e^{-x}} \\]"),
      p("Where \\( \\sigma(x) \\) is the probability of the outcome, and \\( x \\) is the linear combination of the input features. In this case, the linear combination is:"),
      tags$pre("  \\[ x = \\beta_0 + \\beta_1 Pclass + \\beta_2 Sex + \\beta_3 Age + \\beta_4 SibSp + \\beta_5 Parch + \\beta_6 Fare \\]"),
      p("The coefficients \\( \\beta_i \\) are estimated from the data using maximum likelihood estimation. The model predicts the probability of survival, and a threshold (usually 0.5) is applied to classify the outcome as survived or not survived."),
      
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
