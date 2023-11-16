####http://euclid.psych.yorku.ca/www/psy6135/tutorials/gapminder.html
library(ggplot2)
library(dplyr)  # data munging
library(scales) # nicer axis scale labels
install.packages("gapminder")
library(gapminder)
if(!require(gapminder)) {install.packages("gapminder"); library(gapminder)}
str(gapminder)
gapminder$country  
print(gapminder) 
table(gapminder$continent, gapminder$year)
with(gapminder, {table(continent, year)})
ggplot(gapminder, aes(x=continent)) + geom_bar()
ggplot(gapminder, aes(x=continent, fill=continent)) + geom_bar()

ggplot(gapminder, aes(x=continent, fill=continent)) + 
  geom_bar(aes(y=..count../12)) +
  labs(y="Number of countries") +
  guides(fill=FALSE)
# record a plot for future use
mybar <- last_plot()
mybar + coord_trans(y="sqrt")
mybar + coord_flip()
mybar + coord_polar()
###
ggplot(data=gapminder, aes(x=lifeExp)) + 
  geom_density()
ggplot(data=gapminder, aes(x=lifeExp)) + 
  geom_density(size=1.5, fill="pink", alpha=0.3)
###
ggplot(data=gapminder, aes(x=lifeExp)) + 
  geom_density(size=1.5, fill="pink", alpha=0.5) +
  geom_histogram(aes(y=..density..), binwidth=4, color="black", 
  fill="lightblue", alpha=0.5)
##
ggplot(data=gapminder, aes(x=lifeExp, fill=continent)) +
  geom_density(alpha=0.3)
###
gap1 <- ggplot(data=gapminder, aes(x=continent, 
                  y=lifeExp, fill=continent))
gap1 +
  geom_boxplot(outlier.size=2)
gapminder %>% 
  mutate(continent = reorder(continent, lifeExp, FUN=median))
gapminder %>% 
  mutate(continent = reorder(continent, lifeExp, FUN=median)) %>%
  ggplot(aes(x=continent, y=lifeExp, fill=continent)) +
  geom_boxplot(outlier.size=2)
#####Part2
# Clear environment
rm(list = ls())
# Clear console
cat("\014")# ctrl+L
#Clear plot
dev.off()    # Close plots ###############

######## Clear mind :) #########################


