## Indexing

## [col, row]
## If you want more than one column not in order then use c(,):
grp_cols <- names(df)[c(1,4)] 


## drop if duplicated in one column
x<-x[!duplicated(x[,1]),]
