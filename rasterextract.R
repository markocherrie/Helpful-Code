library(raster)

gewataB1 <- raster('shapes/t36yes800100.img')
SES<-extract(gewataB1, uk_bng) 
SES<-as.data.frame(SES)
SES[is.na(SES)]<-0