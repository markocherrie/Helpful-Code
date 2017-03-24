### Get surrounding polygons that touch a single one!

Datazone3<- as.data.frame(t(as.data.frame(gTouches(Datazone, Datazone2, byid=T))))
  Datazone@data <-cbind(Datazone@data, Datazone3)
   Datazone<-Datazone[Datazone@data$`385`==T, ]
    Datazone@data$`385`<-NA
