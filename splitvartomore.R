# suppose you have a var that actually represents more variables
# e.g. var "greetingnamelocation" 1st value = hello_marko_Turin

df<-NULL
df$greetingnamelocation<-"hello_marko_Turin"
df$greeting <- sapply(strsplit(as.character(df$greetingnamelocation),"_"),function(x) x[1])
df$name <- sapply(strsplit(as.character(df$greetingnamelocation),"_"),function(x) x[2])
df$location <- sapply(strsplit(as.character(df$greetingnamelocation),"_"),function(x) x[3])
                      
                      
#### Or if you want to do this for lots of csvs

formatcsvs <- function(path){
df<-read.csv(path)
df$greeting <- sapply(strsplit(as.character(df$greetingnamelocation),"_"),function(x) x[1])
df$name <- sapply(strsplit(as.character(df$greetingnamelocation),"_"),function(x) x[2])
df$location <- sapply(strsplit(as.character(df$greetingnamelocation),"_"),function(x) x[3])
# subset based on new columns
df<-df[,c(1,6,7,2,4)]
write.csv(df, path, row.names=F)
}

filenames=list.files(path="test", "*csv", full.names=TRUE)
mapply(formatcsvs, path = filenames)
