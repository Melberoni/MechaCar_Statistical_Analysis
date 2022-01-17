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


##########################################################
# deliverable 3
############################################################

overall_t_stat<- t.test(coil_data$PSI, mu=1500)
overall_t_stat

lot1_tstat<-t.test(subset(coil_data$PSI,coil_data$Manufacturing_Lot =='Lot1'),mu=1500)
lot1_tstat  


lot2_tstat<-t.test(subset(coil_data$PSI,coil_data$Manufacturing_Lot =='Lot2'),mu=1500)
lot2_tstat  

lot3_tstat<-t.test(subset(coil_data$PSI,coil_data$Manufacturing_Lot =='Lot3'),mu=1500)
lot3_tstat  
