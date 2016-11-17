#install.packages('googleViz')
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

library("rvest")
library(stringr)
library(dplyr)
library(genderizeR)
library(ggplot2)
library("googleVis")
library("XML")
paste0("http://www.crn.com/slide-shows/data-center/300076704/2015-big-data-100-business-analytics.htm/pgno/0/", 1:45) %>%
  c(., paste0("http://www.crn.com/slide-shows/data-center/300076709/2015-big-data-100-data-management.htm/pgno/0/",1:30)) %>%
  c(., paste0("http://www.crn.com/slide-shows/data-center/300076740/2015-big-data-100-infrastructure-tools-and-services.htm/pgno/0/",1:25)) -> webpages
results=data.frame()
for(x in webpages)
{
  read_html(x) %>% html_nodes("p:nth-child(1)") %>% .[[2]] %>% html_text() -> Company
  read_html(x) %>% html_nodes("p:nth-child(2)") %>% .[[1]] %>% html_text() -> Executive
  results=rbind(results, data.frame(Company, Executive))
}
results=data.frame(lapply(results, as.character), stringsAsFactors=FALSE)
results[24,]=c("Trifacta", "Top Executive: CEO Adam Wilson")
results %>% mutate(Name=gsub("Top|\bExec\S*|\bCEO\S*|President|Founder|and|Co-Founder|\:", "", Executive)) %>%
  mutate(Name=word(str_trim(Name))) -> results
results %>%
  select(Name) %>%
  findGivenNames() %>%
  filter(probability > 0.9 & count > 15) %>%
  as.data.frame() -> data
data %>% group_by(gender) %>% summarize(Total=n()) -> dat
doughnut=gvisPieChart(dat,
                      options=list(
                        width=450,
                        height=450,
                        legend="{ position: 'bottom', textStyle: {fontSize: 10}}",
                        chartArea="{left:25,top:50}",
                        title='TOP 100 BIG DATA COMPANIES 2015
                        Gender of CEOs',
                        colors="['red','blue']",
                        pieHole=0.5),
                      chartid="doughnut")
plot(doughnut)
