##### Spatial data procedures can throw up more problems than with a dataframe
##### There's a lot of good resouces out there:

# http://www.maths.lancs.ac.uk/~rowlings/Teaching/UseR2012/cheatsheet.html

##### Here are some bit and bobs that have come in handy


# Conditional mean replacement of missing values in spatialpointsdataframe
# spatial= spatialpointsdataframe
# exp= exposure variable
# condition= conditional variable

spatial@data$exp[is.na(spatial@data$exp) & spatial@data$condition==1]<-mean(spatial@data$exp[spatial@data$condition==1], na.rm=T)
spatial@data$exp[is.na(spatial@data$exp) & spatial@data$condition==0]<-mean(spatial@data$exp[spatial@data$condition==0], na.rm=T)


## Splitting up a large shapefile into bitesize pieces
## Example datazones by local authority
path="C:/mcherrie/"
geo<-readOGR(path, layer="DZ_2011_EoR_Scotland")
list<-unique(geo@data$CouncilA_2)
for (i in list){
  geo2<-subset(geo, CouncilA_2==i)
  saveRDS(geo2, paste0(path,i, ".rds"))
}
