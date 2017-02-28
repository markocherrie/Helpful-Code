## Keep a clean analysis workflow by calling other files to load data and functions, and perform cleaning
## Good tip from https://susanejohnston.wordpress.com/2015/05/12/an-introduction-to-reproducible-research-in-r-and-r-studio/

for (i in c("load", "functions","clean")){
  source(paste0(i, ".R"), echo=TRUE)
}
