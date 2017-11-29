# If you need to fillin the next observation with the previous ones, 
# for each paticipant, this piece of code which uses the zoo package is handy

df2<-do.call(rbind, by(df, df$Participant_ID, na.locf))

