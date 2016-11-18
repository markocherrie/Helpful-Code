### IMAGE IMPORTED INTO GIMP
### CROPPED TO THE NUMBERS
### CONVERTED TO GRAYSCALE
### THEN BLURRED
### RESIZE IN 300%

###THE WAY IVE GOT IT TO WORK IS IF YOU DO 2 COLUMNS but doesnt work with other columns ***

##ocr 
i="scan6_3"
setwd("C:/Users/mcherrie/Downloads/pdfs")
shell(shQuote(paste0("tesseract ", i, ".png ", i, " -psm 6 digits" )))
test<-readLines(paste0(i,".txt"))
### clean up
test2<-gsub("I", "1", test)
test2<-gsub("l", "1", test2)
test2<-gsub("L", "1", test2)
test2<-gsub("\\|", "1", test2)
test2<-gsub(",", "", test2)
test2<-gsub("S", "5", test2)
test2<-gsub("o", "0", test2)
test2<-gsub("\\.", ",", test2)
## missing
test2<-gsub("â???"", "NA", test2)
test2<-gsub("-", "NA", test2)
test2<-gsub("_", "NA", test2)
test2<-gsub("NANA", "NA", test2)

## final clean up
test2<-gsub("[[:punct:]]", "", test2)

## trim leading and trailing
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
test2<-trim(test2)

## delete rows that have no data
rows<-grep(" ", test2)
test2<-test2[c(rows)]

# if you have blurb
#test2<-test2[-c(1:7)]
#test2<-test2[-c(65:76)]
#sub('^\\D*', '', test2)

test2<-strsplit(test2, "[ ]{1,}")

test2<-do.call(rbind, test2)
test2<-as.data.frame(test2)
write.csv(test2, paste0(i,".csv"))


### get space away from within words
### test<-gsub("\\s(?=\\S\\s\\S{2,}|\\S$)", "", test, perl=TRUE) DOESN'T WORK