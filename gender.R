####### BASED ON CODE BY https://www.r-bloggers.com/the-gender-of-big-data/
####### What is the percentage of male/female in top academic positions (chancellor/vice chancellor) in UK?
####### Data from wiki

install.packages('googleViz')
setwd("C:/Users/mcherrie/Google Drive/gender")
library(genderizeR)
library(googleViz)
library(dplyr)
library(ggplot2)
uni<-read.csv("gender/unigender.csv")
uni$Chancellor<-str_trim(uni$Chancellor)
uni$Vice.Chancellor<-str_trim(uni$Vice.Chancellor)
uni$Chancellor2 <- gsub("([A-Za-z]+).*", "\\1", uni$Chancellor)
uni$Vice.Chancellor2 <- gsub("([A-Za-z]+).*", "\\1", uni$Vice.Chancellor)
uni$Chancellor2[uni$Chancellor2==""]<-NA
uni$Vice.Chancellor2[uni$Vice.Chancellor2==""]<-NA

uni %>%
  select(Chancellor2) %>%
  findGivenNames() %>%
  as.data.frame() -> data

uni %>%
  select(Vice.Chancellor2) %>%
  findGivenNames() %>%
  as.data.frame() -> data2

names(data)[names(data)=="name"] <- "Chancellor2"
names(data2)[names(data2)=="name"] <- "Vice.Chancellor2"

uni$Chancellor2<-tolower(uni$Chancellor2)
uni$Vice.Chancellor2<-tolower(uni$Vice.Chancellor2)
uni2<-merge(uni, data, by="Chancellor2")
uni3<-merge(uni, data2, by="Vice.Chancellor2")


unichange<-merge(uni, uni2, by="University", all=T)
#write.csv(unichange, "unichange.csv")

## start from here to not generate again

uni2<-read.csv("unichange.csv")
uni2 %>% group_by(gender) %>% summarize(Total=n()) -> dat
doughnut=gvisPieChart(dat,
                      options=list(
                        width=450,
                        height=450,
                        legend="{ position: 'bottom', textStyle: {fontSize: 10}}",
                        chartArea="{left:25,top:50}",
                        title='British Universities
                        Gender of Chancellors',
                        colors="['red','blue', 'grey']",
                        pieHole=0.5),
                      chartid="doughnut")
plot(doughnut)


uni3 %>% group_by(gender) %>% summarize(Total=n()) -> dat
doughnut=gvisPieChart(dat,
                      options=list(
                        width=450,
                        height=450,
                        legend="{ position: 'bottom', textStyle: {fontSize: 10}}",
                        chartArea="{left:25,top:50}",
                        title='British Universities
                        Gender of Vice Chancellors',
                        colors="['red','blue']",
                        pieHole=0.5),
                      chartid="doughnut")
plot(doughnut)

