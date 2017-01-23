## Indexing

## [row, col]
## If you want more than one column not in order then use c(,):
x <- names(x)[c(1,4)] 


## drop if duplicated in one column
x<-x[!duplicated(x[,1]),]


## drop if missing in one column
x<-x[!(is.na(x[,1)]
