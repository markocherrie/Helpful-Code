https://rstudio-pubs-static.s3.amazonaws.com/301056_e188ebc4c8644410b4abbc4ae98b6c98.html

Gridding data
We are often interested in summarizing spatial data onto a grid for presentations. A typical example are logbook data which often can hold millions of records. Lets read in some bottom trawl logbook data from Iceland:

# You have to download the data from our sharepoint 
station  <- read_csv("data/logbook_station.csv")
glimpse(station)
## Observations: 109,928
## Variables: 6
## $ id      <int> 31746565, 31746576, 31746577, 31746578, 31746579, 3174...
## $ date    <date> 1995-02-26, 1995-02-26, 1995-02-26, 1995-02-26, 1995-...
## $ lon     <dbl> -25.01667, -25.23333, -25.20000, -25.28333, -24.35000,...
## $ lat     <dbl> 63.00000, 62.81667, 62.71667, 62.76667, 63.71667, 63.9...
## $ depth   <int> 295, 280, 230, 290, 100, 210, 140, 130, 190, 200, 210,...
## $ towtime <int> 270, 240, 50, 80, 240, 230, 300, 240, 60, 120, 130, 80...
So we have some 100+ thousand tows with information of towtime (in minutes).

As an example we could summarize the effort by year and ICES statistical rectangle as follows (read the help file on d2ir):

st <- 
  station %>% 
  mutate(year = year(date),
         sq = geo::d2ir(lat, lon)) %>% 
  group_by(year, sq) %>% 
  summarize(effort = sum(towtime / 60, na.rm = TRUE))
glimpse(st)
## Observations: 292
## Variables: 3
## $ year   <dbl> 1995, 1995, 1995, 1995, 1995, 1995, 1995, 1995, 1995, 1...
## $ sq     <chr> "50C2", "51C2", "52C3", "52C4", "53C0", "53C2", "53C3",...
## $ effort <dbl> 5.750000, 7.000000, 9.166667, 15.500000, 14.333333, 5.5...
We have condensed the data to some 292 records but in doing so we have lost the information on the coordinates. Hence before we proceed with any plotting we need to get the central position of the ICES rectangles (using the inverse of the function above):

st %>% 
  mutate(lon = geo::ir2d(sq)$lon,     # get the central position of
         lat = geo::ir2d(sq)$lat) %>% #   the ices rectangle
  ggplot() +
  theme_bw() +
  geom_raster(aes(lon, lat, fill = effort/1e3)) +  
  geom_polygon(data = iceland, aes(long, lat, group = group), fill = "grey") +
  coord_quickmap() +
  scale_x_continuous(name = NULL, breaks = NULL) +
  scale_y_continuous(name = NULL, breaks = NULL) +
  scale_fill_continuous(type = "viridis", option = "B", direction = -1) +
  labs(fill = "Effort",
       title = "Bottom trawl effort in 1000 hours") +
  facet_wrap(~ year)
