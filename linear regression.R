library(ggplot2)
library(ggthemes)
library(dplyr)
df <- read.csv('Concretev1.csv')
print(df)
#num only
num.cols <- sapply(df, is.numeric)
#Filter
cor.data <- cor(df[,num.cols])
print(cor.data)
print(corrplot(cor.data,method = 'color'))
corrgram(df)
#Histogram
ggplot(df, aes(x=superplastic)) + geom_histogram(bins=20,alpha=0.5,fill='blue')

#Split Data into Train and Test Set
#1st step seed to getbthe same randoms
set.seed(101)
#split the sample with caTools, select the column and set the split ratio for True
sample <- sample.split(df$strength,SplitRatio = 0.7)
#Split at 70%
train <- subset(df,sample == TRUE)
#split at 30%
test <- subset(df,sample == FALSE)
#Train and build modwl
ConcreteModel <- lm(strength ~ ., data = train)
print(summary(ConcreteModel))
#
res <- residuals(ConcreteModel)
class(res)
res <- as.data.frame(res)
head(res)
#Resuduals are the difference between the actual data point and prdicted linear regression model
ggplot(res,aes(res)) + geom_histogram(fill='blue',alpha=0.5)
