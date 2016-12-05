# Bit of a tricky one to explain, if you have a function that outputs 
# a character that references an object with values that you then want 
# to use, then use the 'get' function. 

# In my case I had the best fitting model output as a character, and then
# an object which contained all the values, to be used in a linear model.

# See below;

# s would the models, with s[1] (i.e. "aa" being best fitting
s <- c("aa", "bb", "cc", "dd", "ee") 
y <-  rnorm(n=72, mean=102, sd=5.2)
aa <- replicate(1,sample(0:1,72,rep=TRUE))

#' This is how we get it into the model
model <- cbind(y, get(s[1]))
model <- data.frame(model)
modeloutput<- lm(y~ V2, data=model)
summary(model)
