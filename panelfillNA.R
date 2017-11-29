# If you need to fill in the next observation with the previous ones, 
# for each paticipant, this piece of code which uses the zoo package is handy


# Here we say, for each observation carry it onto the next time point for each participant
# i.e. Last Observation Carried Forward
df2<-do.call(rbind, by(df, df$Participant_ID, na.locf))

# Now with the new dataset we might say that if they haven't specified a variable then when they did 
# take that and use if for the previous time points, for each participant
# i.e. Next Observation Carried Backward

df2<-do.call(rbind, by(df2, df2$Participant_ID, function(x) na.locf(x, fromLast = T)))
