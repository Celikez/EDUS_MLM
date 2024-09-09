# INFO =============================================================


# Course: EDUS 664 EDUS
# Script: MLM_CR1
# Contact: Elif Celik


#==========Script==================


#Question 1

# Load packages

install.packages('tidyverse')
install.packages('haven')
install.packages('psych')
library("tidyverse")
library("haven")
library("psych")

#load in the dataset, hsb2.dta, using the read_dta()
read_dta('C:/Users/Smal Dog Elif/Downloads/hsb2.dta')
df <- read_dta('C:/Users/Smal Dog Elif/Downloads/hsb2.dta')

#Question 2 

#summary of the dataset using the glimpse() 
glimpse(df)
summary(df)
describe(df)

#specifically for the variable prog 
describe(df$prog)

#tabulation 
table(df$prog)
str(df$prog)

# question 3

#create use filter() to create three separate datasets

str(df$ses)

ses_low1 <- df %>%
  filter (ses==1)
ses_medium2 <- df %>%
  filter (ses==2)
ses_high3 <- df %>%
  filter (ses==3)

# hist() function to make a histogram for each
#par(mfrow = c(1, 3)) side by side

hist(ses_low1$write,xlab="score",ylim=c(0, 25),
     main= "Low SES")

hist(ses_medium2$write, xlab="score",ylim=c(0, 25),
     main= "Medium SES")

hist(ses_high3$write,xlab="score",ylim=c(0, 25),
     main= "High SES")
par(mfrow = c(1, 1))

#boxplot for better comparison
boxplot(write ~ ses, 
        data = df, 
        main = "Writing Scores by SES",
        xlab = "SES Level",
        ylab = "Writing Scores",
        names=c("Low SES","Medium SES","High SES"),
        col = c("plum1", "peachpuff", "#DECBE4"),
        border = "black")
