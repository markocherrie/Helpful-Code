# The readr package allows you to parse information from stings... very easily
# Take this example: we'd like to get the date from a filename

x<-"C:/Users/mcherrie/Local Financial Returns 2010-11 - workbooks - LFR02.xlsx"
year <- parse_number(x)

# parse_number take the first number and then drops all the characters before and after

# there is also parse_character, parse_date, parse_datetime, parse_logical... very useful!
