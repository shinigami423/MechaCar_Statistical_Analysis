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
sample_table <- suspension_coil %>% sample_n(50) # randomly select 50 data points 

## T.test - determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds/in^2
t.test(sample_table$PSI,mu=mean(suspension_coil$PSI)) # test the 50 random samples to population mean

## determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds/in^2
### Lot 1 
lot1_sample <- suspension_coil %>% subset(Manufacturing_Lot=="Lot1") #create table for lot1 samples
t.test((lot1_sample %>% sample_n(30))$PSI,mu=mean(suspension_coil$PSI)) #test 30 Lot 1 samples to population mean
### Lot 2
lot2_sample <- suspension_coil %>% subset(Manufacturing_Lot=="Lot2") #create table for lot2 samples
t.test((lot2_sample %>% sample_n(30))$PSI,mu=mean(suspension_coil$PSI)) #test 30 Lot 2 samples to population mean
### Lot 3
lot3_sample <- suspension_coil %>% subset(Manufacturing_Lot=="Lot3") #create table for lot3 samples
t.test((lot3_sample %>% sample_n(30))$PSI,mu=mean(suspension_coil$PSI)) #test 30 Lot 3 samples to population mean
