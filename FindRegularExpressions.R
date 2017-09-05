## Gives you a table of boolean output on how many cells with "hello" in it in the column greetings

table(grepl("hello", data$greetings))

## More on regular expressions another time

# If you want to find an exact match, encase the search with "\\b", for example:

data$greetings<-sub("\\bhello\\b", "hiya", data$greetings)
