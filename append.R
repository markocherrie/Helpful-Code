# So simple yet it's probably little known: the append function

# say we need to format lots of files with the same header info

# we are gettin the header info from different places

# i.e. some might be meta data, whereas other column names might be the data itself

metacolnames<-c("x", "y", "z")
datacolnames<-dput(names(df))
mastercolnames<-append(metacolnames,datacolnames) 

# Now use mastercolnames to format lots of files with the same structure!
