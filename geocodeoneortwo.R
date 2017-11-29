# Sometimes you want to geocode some addresses, too many to do manually and not enough to go through a proper batch procedure.
# What you want to do is take a function that queries a geocoder and then spit the results back into the dataframe.

# First of all create a geocoding function
Google <- function(str,verbose=FALSE) {
  construct.geocode.url <- function(str, return.call = "json", sensor = "false") {
    root <- "http://maps.google.com/maps/api/geocode/"
    u <- paste(root, return.call, "?address=", str, "&sensor=", sensor, sep = "")
    return(URLencode(u))
  }
  if(verbose==FALSE) cat(str,"\n")
  u <- construct.geocode.url(str)
  doc <- getURL(u)
  x <- fromJSON(doc,simplify = FALSE)
  if(x$status=="OK") {
    lat <- x$results[[1]]$geometry$location$lat
    lng <- x$results[[1]]$geometry$location$lng
    data<-(data.frame(lat=as.numeric(lat), long=as.numeric(lng)))
  } else {
    data<-(data.frame(lat=NA, long=NA))
  }
  Sys.sleep(5)
  return(data)
} 

# The key here is to output the data as a dataframe!
# Be careful what you're else statement outputs or you might find that it writes data wide.... nightmare

# Then, run through each row and append the result to the end of the dataframe

df2<-cbind(df, t(sapply(paste0(df$Postcode.x, ", Scotland") , Google, USE.NAMES=F))) 

# If you append your address string with extra info (e.g. ", Scotland") then remember to screen the output for 
# geocodes that are for scotland only (for google it geocodes ", scotland" to near loch tay), this will happen if you geocode
# an NA address string.



