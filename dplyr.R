
# Don't know how many times that this has caught me out but DON'T LOAD PLYR AFTER DPLYR !
# IF YOU NEED TO USE BOTH THEN LIBRARY(PLYR) THEN LIBRARY(DPLYR) ... YES I AM SHOUTING AT THE SCREEN !

# Because I always forget the exact specifications for a dplyr call, heres a lengthy command with several options

# select data then pipe it into functions to do stuff to it
data2012 %>% 

# group by one variable
  group_by(Council) %>%
  
# group by multiple variable

# summarise by function (mean) non NA data 
  summarize(densitymean2012 = mean(density, na.rm = TRUE)) %>%

# Create a column which is the rank of another
  mutate(densitymean2012rank = row_number(-densitymean2012))%>%
  
# Filter by a multiple subsetting options
  filter(densitymean2012 > 1, densitymean2012rank == 1) %>%
 
# only have a selection of columns in the final dataset
  select(Council, densitymean2012, densitymean2012rank)
  

