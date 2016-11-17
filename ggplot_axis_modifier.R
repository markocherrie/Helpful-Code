# Sometimes you will create a plot in ggplot and you've transformed the variables in the model but you want the labels
# to be values that are easier to interpret. Thus you want a little function before the ggplot-type call to help with this:

## ORIGINAL CODE FROM: http://stackoverflow.com/questions/10762287/how-can-i-format-axis-labels-with-exponents-with-ggplot2-and-scales
## Here it is:

scientific_10 <- function(x) {
  parse(text=gsub("e", " %*% 10^", scientific_format()(x)))
}

### Of course this can be modified to do whatever you like, for example exponentiate the y axis and multiply the x axis by 100:

Exp <- function(x) {
  parse(text=round(exp(x), 2))
}

Multiply <- function(x) {
  parse(text=round(x*100))
}

### Then all you need to do is stick it in the ggplot "scale_y_continuous" of "scale_x_continuous" argument, see below, 
### using the ggplot based "interplot":

library(interplot)
interplot(m = model, var1 = "distance1", var2 = "distance2") + 
  # Add labels for X and Y axes
  xlab("distance 2 (m)") +
  ylab("Estimated odds ratio of distance 1") +
  scale_y_continuous(label=Exp)+
  scale_x_continuous(label=Multiply)+
  # Change the background
  theme_bw() +
  # Add the title
  ggtitle("Estimated effect of distance 1 on health, conditional on distance 2") +
  theme(plot.title = element_text(face="bold")) +
  # Add a horizontal line at y = 0
  geom_hline(yintercept = 0, linetype = "dashed")
