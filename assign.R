# Have you ever had the issue where you need to dynamically assign an object name
# For example the mulitplot function requires you to list all the ggplot objects that you want to combine in the following manner:
# multiplot(p1,p2,p3,p4)
# But if you are creating the graphs in a loop then you need to use assign to get a new name for each graph output:


library(dplyr)
library(ggplot2)

# run multiplot from here: http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_(ggplot2)/
data<-read.csv("data/exposure.csv")
list<-dput(unique(data$Variable))

for (var in list){
data<-read.csv("data/exposure.csv")
data<-subset(data, !is.na(Estimate) & Variable==var) 
grouped <- group_by(data, grouping, year)
groupeddata<-summarise(grouped, mean=mean(Estimate), sd=sd(Estimate),
                       n=n())
groupeddata2<- mutate(groupeddata, se=sd/sqrt(n), lower.ci = mean - qt(1 - (0.05 / 2), n - 1) * se,
                      upper.ci = mean + qt(1 - (0.05 / 2), n - 1) * se)
pd <- position_dodge(0.1) 

output<-ggplot(groupeddata2, aes(x=year, y=mean, colour=grouping)) + 
  geom_errorbar(aes(ymin=lower.ci, ymax=upper.ci), width=.1, position=pd) +
  geom_line(position=pd) +
  geom_point(position=pd) 

################################## THE KEY BIT ######################################
assign(var, output)
#####################################################################################
ggsave(paste0("graphs/", var, ".png"))
}

noquote(paste(list[-9], collapse=", "))
# copy and paste below output into multiplot command

multiplot(ya, da,da2, ya2, cols=4)



##################### and check out the get function
var="dynamicgroupvar"
grouped <- group_by(df, get(var), date)




