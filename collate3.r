# Roger Palay copyright 2016-01-31
# Saline, MI 48176
#
collate3 <- function( lcl_list, use_low=NULL, use_width=NULL, ...)
{ 
  ## This is a function that will mimic, to some extent, a program
  ## that we had on the TI-83/84 to put a list of values into
  ## bins and then compute the frequency, midpoint, relative frequency,
  ## cumulative frequency, cumulative relative frequency, and the
  ## number of degrees to allocate in a pie chart for each bin.
  
  ## One problem here is that getting interactive user input in R
  ## is a pain.  Therefore, if the use_low, and or use_width
  ## parameters are not specified, the function returns summary
  ## information and asks to be run again with the proper values
  ## specified.
  
  lcl_real_low <- min( lcl_list )
  lcl_real_high <- max( lcl_list ) 
  lcl_size <- length(lcl_list)
  
  if( is.null(use_low) | is.null(use_width) )
  {
    
    cat(c("The lowest value is ",lcl_real_low ,"\n"))
    cat(c("The highest value is ", lcl_real_high,"\n" ))
    suggested_width <- (lcl_real_high-lcl_real_low) / 10 
    cat(c("Suggested interval width is ", suggested_width,"\n" ))
    cat(c("Repeat command giving collate3( list, use_low=value, use_width=value)","\n"))
    cat("waiting...\n")
    return( "waiting..." )    
  }
  ## to get here we seem to have the right values
  use_num_bins <- floor( (lcl_real_high - use_low)/use_width)+1
  lcl_max <- use_low+use_width*use_num_bins
  lcl_breaks <- seq(use_low, lcl_max, use_width)
  lcl_mid<-seq(use_low+use_width/2, lcl_max-use_width/2, use_width)
  
  lcl_cuts<-cut(lcl_list, breaks=lcl_breaks, ...)
  lcl_freq <- table( lcl_cuts )
  lcl_df <- data.frame( lcl_freq )
  lcl_df$midpnt <- lcl_mid
  lcl_df$relfreq <- lcl_df$Freq/lcl_size
  lcl_df$cumulfreq <- cumsum( lcl_df$Freq )
  lcl_df$cumulrelfreq <- lcl_df$cumulfreq / lcl_size
  lcl_df$pie <- round( 360*lcl_df$relfreq, 1 )
  
  lcl_df
}