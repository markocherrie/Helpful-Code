# say you want to iterate over a number of files (n=3971 in the example), but you want to do it in 300 file batches
# this will split your files so you can then run the function via mdply

input<-0:3971
input2<-input[(input %% (300)) == 0]+1
input3<-input2+299
input3[length(input3)]<-max(input)
input4<-data.frame(filebatchfrom=input2, filebatchto=input3)

# The main crux here is the modulo symbol, which divides the number and gives the remainder
# I use it here as a condition to only give me numbers that divide exactly by 300 (i.e. 0 remainder)

