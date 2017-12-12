# get a progress bar for a loop

total <- 20
# create progress bar
pb <- tkProgressBar(title = "progress bar", min = 0,
                    max = total, width = 300)

for(i in 1:total){
   Sys.sleep(0.1)
   setTkProgressBar(pb, i, label=paste( round(i/total*100, 0),
                                        "% done"))
}
close(pb)

# credit: https://ryouready.wordpress.com/2009/03/16/r-monitor-function-progress-with-a-progress-bar/

# Quite useful, if you are using mdply to apply a funtion over a dataframe, add the following to get a progress bar in the terminal!

newdata<-mdply(data, 
               function,
               .progress=plyr::progress_text(style = 3))
