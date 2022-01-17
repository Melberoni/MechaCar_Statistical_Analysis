library(tidyverse)

plt<- ggplot(mpg,aes(x=class)) #import dataset into ggplot2
plt+geom_bar() #plot a bar plot

mpg_summary<- mpg %>% group_by(manufacturer)%>% summarize(vehicle_count=n(),groups='keep')#create summary table
plt<-ggplot(mpg_summary,aes(x=manufacturer,y=vehicle_count))
plt+geom_col()+xlab("Manufacturing Company")+ylab("number of Vehicles in Dataset")+
  theme(axis.text.x=element_text(angle=45,hjust=1))#rotate the x axis label
mpg_summary<- subset(mpg, manufacturer=='toyota') %>% group_by(cyl)%>% summarize(Mean_hwy=mean(hwy),.groups='keep')
plt<-ggplot(mpg_summary, aes(x=cyl,y=Mean_hwy))
plt + geom_line()+scale_x_discrete(limits=c(4,6,8))+scale_y_continuous(breaks=c(15:30))


plt<-ggplot(mpg, aes(x=displ,y=cty, color=class, shape=drv, size=cty))

plt+geom_point()+labs(x="engine Size(L)",y="city Fuel-Efficiency (mpg)", color="vehicle class", shape="Type of Drive")

# boxplot
plt<- ggplot(mpg,aes(x=manufacturer,y=hwy))
plt+geom_boxplot(outlier.color = "red")+theme(axis.text.x=element_text(angle=45,hjust=1))


#**heatmap

mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))
plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)") #create heatmap with labels




mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) #import dataset into ggplot2
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") +#add heatmap with labels > 
theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5)) #rotate x-axis labels 90 degrees

#layering graphs



plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + #add boxplo
theme(axis.text.x=element_text(angle=45,hjust=1)) + #rotate x-axis labels 45 degrees
geom_point() #overlay scatter plot on top


mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") #add scatter plot



mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot with labels
geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars

#facets

mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)

plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees


plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + #create multiple boxplots, one for each MPG type
theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") #rotate x-axis labels

#plot the distribution
ggplot(mtcars,aes(x=wt)) + geom_density() #visualize distribution using density plot

#test for normality #pvalue>=.05=normal distribution
shapiro.test(mtcars$wt)
