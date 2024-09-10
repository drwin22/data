temp<-c(112, 100, 127, 120, 134, 118, 105, 110, 109, 112, 110, 
        118, 117, 116, 118, 122, 114, 114, 105, 109, 107, 112,
        114, 115, 118, 117, 118, 122, 106, 110, 116, 108, 110, 
        121, 113, 120, 119, 111, 104, 111, 120, 113, 120, 117, 
        105, 110, 118, 112, 114, 114)
H = max(temp)
L = min(temp)
Range = H - L
Width = ceiling(Range/7)
#installed package agricolae
library(agricolae)
#since the histogram division is from 100 to 135, there is 
#a shift in the ogive curve, when compared with the original
temp.h=hist(temp,main="Histogram of Recorded Temparatures",
            xlab="temparature",border="red",col="yellow",
            xlim=c(100,135),las=1,breaks=7)
ogive.freq(temp.h, xlab="temparature",
           ylab="relative cumulative frequency")
########clear console############################
# Clear environment
#rm(list = ls()
# Clear console
cat("\014")# ctrl+L
#Clear plot
dev.off()    # Close plots #####################

######## Clear mind :) #########################