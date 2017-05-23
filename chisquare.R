## descriptive stats
CHI<-function(pop1,number1, pop2, number2){
data = matrix(c(number1,number2,(pop1-number1),(pop2-number2)),ncol=2)
chisq.test(data,correct=F)
}

CHI(1091, 226, 281, 54)
