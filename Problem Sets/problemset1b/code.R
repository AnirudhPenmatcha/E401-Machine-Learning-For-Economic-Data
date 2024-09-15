#library(car)

#################################

# Part 1: R Questions

#################################

# Question 1: Loading, summarizing and plotting the dataset

dataframe <- read.csv("Advertising.csv")
summary(dataframe)
plot(dataframe)

#################################

# Question 2: Simple Linear Regression

# Yes, there is a relationship between sales and the mediums of advertisement. 
# TV and Sales have a clear linear relationship. With more advertisements on TV, the sales are almost proportionally high.
# Radio and Sales also share somewhat of a relationship, however, it isn't as linear as with TV and Sales. 
# Newspaper and Sales don't show much of a relationship. Which means investing much of the advertising budget in Newspapers will not be worthwhile.

print(dataframe[5])

# Running a simple regression over each of the variables
lm_model_TV <- lm(unlist(dataframe[5]) ~ unlist(dataframe[2]), data = dataframe)
summary(lm_model_TV)
plot(unlist(dataframe[2]), unlist(dataframe[5]))
abline(lm_model_TV, col = "red")

lm_model_RADIO <- lm(unlist(dataframe[5]) ~ unlist(dataframe[3]), data = dataframe)
summary(lm_model_RADIO)
plot(unlist(dataframe[3]), unlist(dataframe[5]))
abline(lm_model_RADIO, col = "blue")

lm_model_NEWSPAPER <- lm(unlist(dataframe[5]) ~ unlist(dataframe[4]), data = dataframe)
summary(lm_model_NEWSPAPER)
plot(unlist(dataframe[4]), unlist(dataframe[5]))
abline(lm_model_NEWSPAPER, col = "green")

# We see from the graphs that the coefficients of TV and Sales model have a good fit. Radio and Sales have an average fit.
# And Newspaper and Sales has the worst fit. As for each medium's contribution to sales, TV and Radio definitely contribute, but
# Newspaper doesn't seem to. 

#################################

# Question 3: Multiple Linear Regression

mult_lm_model <- lm(unlist(dataframe[5]) ~ unlist(dataframe[4]) + unlist(dataframe[3]) + unlist(dataframe[2]), data = dataframe)
summary(mult_lm_model)
mult_lm_model$coefficients

# The coefficient of newspaper is negative while TV and Radio are positive. We also see the p-value given in the summary as
# less than 2.2e-16 which means that coefficients are statistically significant because typically a p-value < 0.05 is considered
# statistically significant. 

# Do they all contribute to sales?
# Newspaper definitely doesn't because of the negative relationship. But TV and Radio do due to the positive coefficients.

# Reconciling results of multiple and simple regressions for newspaper
# If we look at the coefficients of the simple Linear Regression's model and compare it with the respective coefficients of the 
# Multiple Linear Regression models, they aren't too far apart. It won't be the exact same but will be close to each other 
# because in multiple Linear Regression model, it's trying to fit it for all the three advertising mediums. 

# How strong is the relationship between advertising and sales?
# It's mostly okay because it's not the strongest with Radio and Newspaper but if a business had to invest their budget 
# into advertisements for increasing their sales, then they should do it only in TV and Radio because they have good relationship
# with sales. 

# Discussing R-squared results
# The R-Squared value is computed to be 0.8972 or 89.72% which is very good. It means that we got a good fit and the model is 
# able to accurately predict the output for 90% of the data. However, it is also important to keep in mind to use other 
# metrics 

# Plotting a 3d graph of Sales, TV and Radio.

#scatter3d(Sales~TV+Radio)

################################
# Question 4: Models with interaction terms

lm_model_TV_Radio <- lm(unlist(dataframe[5]) ~ unlist(dataframe[3]) * unlist(dataframe[2]), data = dataframe)
summary(lm_model_TV_Radio)
# R-squared = 0.9678 (or) 96.78; F-statistic = 1963
# It seems like the R-Squared has gone up by a lot more. And the F-statistic is much higher which means it is 
# statistically significant and does a much better job of explaining the variation in the dependent variable, which means it estimates the output
# quite precisely. So yes, there is a lot of synergy between TV and Radio due to the improved performance that we've observed.

# Experimenting with variations in interaction terms
lm_model_TV_Newspaper <- lm(unlist(dataframe[5]) ~ unlist(dataframe[4]) * unlist(dataframe[2]), data = dataframe)
summary(lm_model_TV_Newspaper)
# R-squared = 0.6458 (or) 64.58%; F-statistic = 120.6

lm_model_Radio_Newspaper <- lm(unlist(dataframe[5]) ~ unlist(dataframe[4]) * unlist(dataframe[3]), data = dataframe)
summary(lm_model_Radio_Newspaper)
# R-squared = 0.3335 (or) 33.35%; F-statistic = 32.7

################################# 

# Question 5: Optimize sales

# How should the budget be divided between TV & Radio? 
budget_TV_Radio <- lm(unlist(dataframe[5]) ~ unlist(dataframe[3]) * unlist(dataframe[2]), data = dataframe)
summary(budget_TV_Radio)

## *I'm not sure how to answer this question* ##


#################################

# Part 2: Reading

#################################

# What is the goal of Machine Learning? 
# To develop high performance models that give useful predictions under computing restraints 

# What does Varian mean by "good out of sample predictions"?
# It means to get good estimates or predictions on data that the model hasn't seen yet. Sample here is the data with which 
# the model was estimated. So out of sample would mean data points outside this sample. 

# What is overfitting?
# How Varian explains this is when a model fits linear indepedent variables perfectly with the training data, but don't predict
# well with data outside the training set, then the model is considered to be overfitting the training set. 

# What is model complexity?
# If we visualize a model and observe one that has overfit, it will have a lot of depressions and curves so it touches all the 
# points. However, one that is not overfit or underfit, will look less twisted and bent with a fit which can be considered a good
# one. So these are different comoplexities in models. 

# What is the training data?
# The training data is the dataset with which we estimate our model
