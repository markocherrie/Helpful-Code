## Gives you a table of boolean output on whether there is a cell with hello in it in the column greetings

table(grepl("hello", data$greetings))
