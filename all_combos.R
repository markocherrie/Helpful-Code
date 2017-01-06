# In answer to a stackexchange question, didn't get the answer in in time, but here it is

df1 <- c("a","b","c")
df2 <- c("1","2","3")

df3<-expand.grid(df1,df2)
df3$Var3<-paste0(df3$Var1,df3$Var2)
paste(df3$Var3, collapse=" ")
