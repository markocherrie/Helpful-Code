## Indexing

## [row, col]
## If you want more than one column not in order then use c(,):
x <- names(x)[c(1,4)] 

# renaming single column
colnames(data)[2] <- "newname"


## drop if duplicated in one column
x<-x[!duplicated(x[,1]),]


## drop if missing in one column
x<-x[!(is.na(x[,1])),]


## select non consecutive columns 
cols <- c(1, 4:8, 10)
x<-x[,cols]

# select columns based on regular expression
x<-x[,grep("hi|hello",names(x))]



# to get every nth row (example=3rd)
x<-x[seq(1, nrow(x), 3), ]

