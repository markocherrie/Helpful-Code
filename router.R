## function to get google routes

api_key=""

routetoschool<-function(from, to, mode){
  library(rgdal)
  library(googleway)
  wgs = "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0"    
  test <-google_directions(paste0(as.character(from), ", Scotland"), to, 
                           key=api_key, mode=mode, units = c("metric"))
  tryCatch({
    if (test$status[1]=="OK"){
      test <- decode_pl(test$routes$overview_polyline$points)
      x <- test$lon
      y <- test$lat
      sp<-SpatialLines(list(Lines(Line(cbind(x,y)), ID="a")))
      SLDF = SpatialLinesDataFrame(sp, data.frame(ID=paste0(Postcode.x,"_", typjourn), row.names = c("a")))
      proj4string(SLDF) = CRS(wgs)
      writeOGR(SLDF, dsn="routes", layer=paste0(from,"_", to ,"_",mode), driver = 'ESRI Shapefile',overwrite_layer=TRUE)
      print("all good")
    } else {
      print("issue")
    }
  }, error=function(e){cat("ERROR :",conditionMessage(e), "\n")})
}    
