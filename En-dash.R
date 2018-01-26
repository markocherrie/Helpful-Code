# have you had to where you can't reference a cell value, from an imported dataset (excel in my case)

# the reason might be that you have an n-dash instead of a hyphen

# Put the correct code for the En-dash and it will work

# i.e. this:
data$wave[finaldata2$Site=='9 \u2013 Canary Wharf'& (data$date>='2017-10-16'& data$date<='2017-11-03')]<-3  

# instead of:
data$wave[finaldata2$Site=='9 - Canary Wharf'& (data$date>='2017-10-16'& data$date<='2017-11-03')]<-3      
