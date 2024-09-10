##Category variable #############################
data <- c("o","A","B","AB")
num <- c(9,5,7,4)
b<-data.frame(data,num);b

#################################################

# Create the function.
getmode <- function(bloodtype) {
  mode <- unique(bloodtype)
  mode[which.max(tabulate(match(bloodtype, mode)))]
}

# Create the vector with numbers.
#v <- c(2,1,2,3,3,4,1,5,5,3,2,4,4,4,4,4,4,4,4,2)
bloodtype <- c("o","o","o","o","o","o","o","o","o","o","o",
       "AB","AB","AB","AB","AB","AB",
       "A","A","A","A",
       "B","B","B","B","B","B","B","B","B","B","B","B","B","B")

# Calculate the mode using the user function.
result <- getmode(bloodtype)
print(result)

# Create the vector with characters.
charv <- c("M","I","S","S","I","P","P","I")

# ####Calculate the mode using the user function.
result <- getmode(charv)
print(result)
##########Create the graphs for Categorical data
pie(b$num)
barplot(b$num)
require(qcc)
pareto.chart(b$num)
########clear console############################
# Clear environment
#rm(list = ls()
# Clear console
cat("\014")# ctrl+L
#Clear plot
dev.off()    # Close plots ###############

######## Clear mind :) #########################
