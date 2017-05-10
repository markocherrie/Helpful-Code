#### RUN THIS ON YOUR OWN COMPUTER
packagesstring<- installed.packages()[, "Package"]
saveRDS(packagesstring, "packagestring.RDS")


#### TAKE .RDS FILE TO SAFEHAVEN, PUT IT IN WORKING DIRECTORY

SAFEHAVENinstall<-function(nopackagesinsafehaven){
if (nopackagesinsafehaven=T){
packagesstring<-readRDS("packagestring.RDS")
install.packages(packagesstring)
else if (nopackagesinsafehaven=F)
list.of.packages<-installed.packages()[, "Package"]
new.packages<- packagesstring[!(packagesstring %in% list.of.packages)]
if(length(new.packages)>0) install.packages(new.packages)
else(
  print("Has to be true (T) or false (F)")
)
}
}
  
# Use the command SAFEHAVENinstall(T) or SAFEHAVENinstall(F)