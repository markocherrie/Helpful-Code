# Function to estimate the distance and time for a mode of transport from one place to another, 
# using the google API and googleway package

# google api key- CHANGE THIS TO YOUR ONE
# https://developers.google.com/maps/documentation/distance-matrix/
Gkey="lklllldlkmnlfkndlkfnsl"

# load packages
library(googleway)

# function
distancetimeplace<-function(start, finish, modeoftransport){
  results <- google_distance(origins = paste0(as.character(start)),
                             destinations = finish, 
                             mode = typjourn, key = Gkey, simplify = TRUE)
  if(results$rows$elements[[1]][[1]]!="NOT_FOUND"){
    print(paste0(start, " all good"))
    distancetimesoutput<-as.data.frame(cbind(start, 
                                             finish, 
                                             modeoftransport, 
                                             results$rows$elements[[1]][[1]][[2]],
                                             results$rows$elements[[1]][[2]][[2]],
                                             results$rows$elements[[1]][[3]][[2]]
    ))
    colnames(distancetimesoutput)<-c("start", "finish", "modeoftranport", "distanceinm", "timeinsec", "timeinsecTRAF")
    return(distancetimesoutput)
  } else {
    print(paste0("Issue with ", start))
    distancetimesoutput<-(as.data.frame(cbind(start, 
                                              finish, 
                                              modeoftransport,  
                                              "NA",
                                              "NA",
                                              "NA"
    )))
    colnames(distancetimesoutput)<-c("start", "finish", "modeoftranport", "distanceinm", "timeinsec", "timeinsecTRAF")
    return(distancetimesoutput)
  }
}    

# execute
test<-distancetimeplace("Drummond street, Edinburgh", "The meadows, Edinburgh", "walking")
