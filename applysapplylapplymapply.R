# lapply
backtonormal<-function(x){
  x<-as.numeric(x)
  (x/100000)*20*20
}
master<-cbind(Postcode=master$Postcode, as.data.frame(lapply(master[,2:ncol(master)], backtonormal)))
