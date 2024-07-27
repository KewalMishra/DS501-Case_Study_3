library(shiny)
library(ggplot2)

# Source the global.R script
source("global.R")

# Logistic Regression model using the training dataset
model <- glm(Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare, data = train, family = binomial)

# Defining server logic
shinyServer(function(input, output) {
  
  observeEvent(input$predict, {
    new_data <- data.frame(
      Pclass = as.numeric(input$pclass),
      Sex = input$sex,
      Age = input$age,
      SibSp = input$sibsp,
      Parch = input$parch,
      Fare = input$fare
    )
    
    prediction <- predict(model, newdata = new_data, type = "response")
    survival <- ifelse(prediction > 0.5, "Survived", "Did not Survive")
    color <- ifelse(survival == "Survived", "green", "red")
    
    output$prediction_result <- renderUI({
      HTML(paste("<span style='color:", color, "'>", survival, "</span>"))
    })
    
    output$plot <- renderPlot({
      ggplot(train, aes(x = Age, y = Fare, color = factor(Survived))) +
        geom_point(alpha = 0.5) +
        geom_point(data = new_data, aes(x = Age, y = Fare), color = "red", size = 5) +
        labs(
          title = "Survival Scatter Plot",
          x = "Age",
          y = "Fare",
        )
    })
  })
})
