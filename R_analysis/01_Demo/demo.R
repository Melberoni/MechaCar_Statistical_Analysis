demo_table<-read.csv(file='demo.csv',check.names = F, stringsAsFactors = F)
library(jsonlite)
demo_table2<- fromJSON(txt='demo.json')
x<-c(3,3,2,2,5,5,8,8,9)
x[3]
demo_table[3,"Year"]
demo_table[3,3]
demo_table$"Vehicle_Class"[2]
filter_table<-demo_table2[demo_table2$price>1000,]
filter_table2<- subset(demo_table2, price>10000 & drive == "4wd" & "clean" %in% title_status)
filter_table3 <- demo_table2[("clean" %in% demo_table2$title_status) & (demo_table2$price > 10000) & (demo_table2$drive == "4wd"),]
sample(c("cow", "deer", "pig", "chicken", "duck", "sheep", "dog"), 4)
num_rows <-1:nrow(demo_table)
sample_rows <-sample(num_rows,3)
demo_table[sample_rows,]
demo_table[sample(1:nrow(demo_table), 3),]
library(tidyverse) 
demo_table<- demo_table %>% mutate(milage_per_year=Total_Miles/(2020-Year),IsActive=TRUE) #add columns to original dataframe
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), .groups = 'keep') #create summary table
demo_table3<- read.csv('demo2.csv',check.names=F,stringsAsFactors = F)
long_table<- gather(demo_table3,key="Metric", value="Score",buying_price:popularity)
wide_table<-long_table%>%spread(key="Metric",value="Score")
all.equal(demo_table3,wide_table)
