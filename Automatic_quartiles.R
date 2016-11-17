### Suppose you want to classify people as being in the highest quartile for a number of continuous variables.
### This may come about if you have to calculate allostatic load.
### You don't want to take summary statistics and then use that to define the argument for the ifelse statement... as it will take ages
### and it's sensitive to your sample.
### Using gtools package and "levels" function from the base package this can be achieved easily, see below:

library(gtools)
mydata$cholesterol<-quantcut(mydata$cholesterol, 4)
mydata$cholesterol_Q<-ifelse(mydata$cholesterol==paste(levels(mydata$cholesterol)[4]),1,0)
