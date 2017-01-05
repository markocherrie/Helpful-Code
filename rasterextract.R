#Extract raster values for given points

library(raster)
RASTER <- raster('shapes/t36yes800100.img')
SES<-extract(RASTER, uk_bng) 
SES<-as.data.frame(SES)
SES[is.na(SES)]<-0
