# wrap the code in brackets to plot and to save as an object

library(ggplot2)
(plotandsave<-ggplot(diamonds) + geom_point(aes(x=carat, y=price, color=cut)) + geom_smooth(aes(x=carat, y=price)))
