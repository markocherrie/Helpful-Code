# Have you ever been on the data.gov.uk and been completely perplexed to where the data is available to download 
# ** hand shoots up **

# Well I've just found a brilliant stackoverflow post (https://stackoverflow.com/questions/32034495/list-aviable-wfs-layers-and-read-into-data-frame-with-rgdal)
# that will enable you to get the data that you need in R if it is in WFS format.

# Firstly you'll want to go to the webpage where the data resides: https://data.gov.uk/dataset/fife-secondary-school-catchment-areas

# Then you want to click on the link to the WFS file (more info on this format here: https://en.wikipedia.org/wiki/Web_Feature_Service)

# Then copy the link, for example:
# http://arcgisweb.fife.gov.uk/geoserver/fife/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=fife:SCHOOL_SECONDARY_CATCHMENTS&maxFeatures=1000000&outputFormat=GML2

# Now all you need to do is run the code provided by 'hrbrmstr', replacing the dsn with the copied link:

library(gdalUtils)
library(rgdal)

dsn <- "WFS:http://arcgisweb.fife.gov.uk/geoserver/fife/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=fife:SCHOOL_SECONDARY_CATCHMENTS&maxFeatures=1000000&outputFormat=GML2"

ogrinfo(dsn, so=TRUE)

# You need to put in what you want to extract here..

ogr2ogr(dsn, "sic.shp", "fife:SCHOOL_SECONDARY_CATCHMENTS")

sic <- readOGR("sic.shp", "sic", stringsAsFactors=FALSE)

plot(sic)

# Apparently there are 1,729 WFS files on data.gov.uk so hopefully this comes in useful 
