setwd("C:/Users/Francois/Documents/SPC_24/2100F24")
temp <- read.csv("temp2.csv") # verify the data
head(temp, 50)
tail(temp, 8)
# Get a summary of the data
summary( temp)
# create some new variables just to hold
# some of the values we will use
low_val <- 99
high_val <- 135
step_val <- 5
# then create the "break" points
x_breaks <- seq( low_val, high_val, step_val )
# Now look at the break values
x_breaks
# While we are doing this we might as well set up 
# the midpoint values for each of the intervals
# that we create
x_mid <- seq( low_val + step_val/2,
              high_val - step_val/2, step_val )
# look at those values
x_mid 
# Now we are ready to find out into which interval each
# of the values in our original data, L1, gets put
x <- cut(temp$HITEMP, breaks=x_breaks)
x
# Now we are ready to start building our table.  The 
# variable x holds all those interval names, let us 
# find out the frequency for each interval name
y <- table( x )
# let us see what is y
y
##################
df <- data.frame( y )
df # look at it as it has been created
#
#  now append the mid points to the data frame
df$midpnt <- x_mid 
df   # see what the data frame looks like now
#
#   Now construct the relative frequencies
rf <- df$Freq/length( temp$HITEMP )
rf
#  append that to the data frame
df$relFreq <- rf
df   # see what the data frame looks like now
#   Let us look at the pretty version of the data frame
head( df )  #  note the capital V
#   The next columns to add are the cumulative frequency,
#   the relative cumulative frequency, and the number of
#   degrees to use in a pie chart for each interval
cs <- cumsum( df$Freq )
cs
df$cumul <- cs             # append cumulative sum
n <- length( L1 )
rcf <- cs/n
rcf
df$rel_cumul <- rcf        # append rel_cumul sum
df$pie <- round( 360*rf, 1 )  # append degrees in pie chart
df
head(df)
#
#    Then, rather than do all of that, we can load and 
#    run the collate3() function
source("collate3.R")
#    If we just give collate3 the list of values, L1,
#    it just gives us help in finding the values that
#    we need to give it in addition to the list
collate3(temp$LOWTEMP)
#    So we not take those suggestions but we will give
#    collate3 the list, and the lowest value in the 
#    first interval, and the width of the interval
summary(temp$LOWTEMP)
collate3(temp$LOWTEMP,-80, 10 )
##############################
########clear console############################
# Clear environment
#rm(list = ls()
# Clear console
cat("\014")# ctrl+L
#Clear plot
dev.off()    # Close plots ######################
