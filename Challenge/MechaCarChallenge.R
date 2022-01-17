library(tidyverse)
#linear regression to predict MGP

mecha_car_mpg<-read.csv('MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)#import files
model<-lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=mecha_car_mpg)#generate summary statistics
summary(model)#summary stats
model


#######################################################
#suspension coil dataset analysis
######################################################

coil_data<-read.csv('Suspension_Coil.csv',check.names=F, stringsAsFactors = F)

total_summary<-coil_data%>%summarize(mean(PSI),median(PSI),var(PSI),sd(PSI),n())

lot_summary<- coil_data%>%group_by(Manufacturing_Lot) %>% summarise(mean(PSI),median(PSI),var(PSI),sd(PSI),n())

total_summary

lot_summary
