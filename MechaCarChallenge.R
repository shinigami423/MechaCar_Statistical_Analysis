# Our imports
library(tidyverse)
library(dplyr)


# Deliverable 1: Linear Regression to Predict MPG
mechCar <- read_csv("Resources/MechaCar_mpg.csv") # read our csv
lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=mechCar) # perform linear regression
summary(lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=mechCar)) # summary with p & r-squared values

