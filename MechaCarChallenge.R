# Our imports
library(tidyverse)
library(dplyr)


# Deliverable 1: Linear Regression to Predict MPG
mech_car <- read_csv("Resources/MechaCar_mpg.csv") # import car data
lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=mech_car) # perform linear regression
summary(lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=mech_car)) # summary with p & r-squared values


# Deliverable 2: Create Visualizations for the Trip Analysis
suspension_coil <- read_csv("Resources/Suspension_Coil.csv") #import suspension coil data
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),Std_Dev=sd(PSI),groups='keep') # create total summary df
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),Std_Dev=sd(PSI),groups='keep') # create lot summary df


# Deliverable 3: T-Tests on Suspension Coils

