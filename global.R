library(dplyr)

# Loading the training and test datasets
train <- read.csv("train.csv")
test <- read.csv("test.csv")

# Data preprocessing
# Converting 'Sex' to a factor
train$Sex <- as.factor(train$Sex)
test$Sex <- as.factor(test$Sex)

# Handling missing values
# Filling missing 'Age' with median age
train$Age[is.na(train$Age)] <- median(train$Age, na.rm = TRUE)
test$Age[is.na(test$Age)] <- median(test$Age, na.rm = TRUE)

# Filling missing 'Fare' in test set with median fare
test$Fare[is.na(test$Fare)] <- median(test$Fare, na.rm = TRUE)
