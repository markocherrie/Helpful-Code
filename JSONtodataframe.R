# Get online data into a dataframe

library(RJSONIO)

d = NULL
list<-list.files("data/records/records")
for (i in list){
if(file.exists(paste0("data/records/records/",i,"/record.json"))==TRUE)
{
RecordRaw<-fromJSON(paste0("data/records/records/",i,"/record.json"))
Date<-RecordRaw[['properties']][['timestamp']]
Name<-RecordRaw[['properties']][['fields']][[1]][[2]]
Long<-RecordRaw[['geometry']][['coordinates']][[1]]
Lat<-RecordRaw[['geometry']][['coordinates']][[2]]
ind<-cbind(Date, Name, Long, Lat)
d<-rbind(d, data.frame(ind))
}
else{print(paste("Issue with file in folder:", i))
  }
}
