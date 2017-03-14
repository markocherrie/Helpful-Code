##### Spatial data procedures can throw up more problems than with a dataframe
##### There's a lot of good resouces out there
##### Here are some bit and bobs that have come in handy


# Conditional mean replacement of missing values in spatialpointsdataframe
# spatial= spatialpointsdataframe
# exp= exposure variable
# condition= conditional variable

spatial@data$exp[is.na(spatial@data$exp) & spatial@data$condition==1]<-mean(spatial@data$exp[spatial@data$condition==1], na.rm=T)
spatial@data$exp[is.na(spatial@data$exp) & spatial@data$condition==0]<-mean(spatial@data$exp[spatial@data$condition==0], na.rm=T)
