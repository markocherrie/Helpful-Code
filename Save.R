# If R is taking a long time to load a shapefile then load it once and save as an RDS file.
# This will take much less time to load subsequently

saveRDS(shp, "shapes/shp.rds")

# Can confirm that a shapefile with 6976 features and 11 fields went from loading in 10+ minutes to about 15 seconds

# Credit: http://r-sig-geo.2731867.n2.nabble.com/Long-time-to-load-shapefiles-td7584869.html

## Next one, saving and re-using functions. I use this all the time!!!! 

## save a a function that you have written
save("add2", file="myFunction.Rdata")

## You can also import the function to any other R session with
load("myFunction.Rdata")

#Credit: http://stackoverflow.com/questions/14403332/make-a-user-created-function-in-r

# NOTE TO SELF BENCH MARK THIS!!!
