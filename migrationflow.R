# data  
x<-c(0.960349811,1.828034289,3.970700857,5.319548408,3.655945058,8.382321698,8.799155117)
y<-c(8.740186269,7.109143012,7.966550557,4.98204007,4.348155834,4.83929939,1.797401122)
z<-data.frame(age=c(5,4,5,3,2,1,1))

# arrowplot function
arrowplot<-function(x,y,z){
  coords<-cbind(x,y)
  sp = SpatialPoints(coords)
  spdf = SpatialPointsDataFrame(coords, data)
  km <- kmeans(coords, centers = 2)
  centres<-as.data.frame(km$centers)
  original<-cbind(x,y,z)
  start<-centres[which.min(centres$x),]
  end<-centres[ !(centres$x %in% start$x), ]
  library(ggplot2)
  ggplot(original,aes(x = x,y = y, color=age))+
    geom_point()+
    geom_segment(aes(x = start$x,y = start$y,xend = end$x,yend = end$y),arrow=arrow())
}

arrowplot(x,y,z)
