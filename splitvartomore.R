# suppose you have a var that actually represents more variables
# e.g. var "greetingnamelocation" 1st value = hello_marko_Turin

df<-NULL
df$greetingnamelocation<-"hello_marko_Turin"
df$greeting <- sapply(strsplit(as.character(df$Travel_ID),"_"),function(x) x[1])
df$name <- sapply(strsplit(as.character(df$Travel_ID),"_"),function(x) x[2])
df$location <- sapply(strsplit(as.character(df$Travel_ID),"_"),function(x) x[3])
