library(tidyverse)

# First steps - R
# Introduction to R & Data Visualization 

# Part 1: R Questions 
# Question 1: First Steps with R
# Part 4: Generating sequences of numbers and logical vectors
# 1. 
seq(1:15)
# 2. 
2*1:15
(2*1):15
# There is a difference here. In the first one, it's skipping the value by 2 numbers. 
# In the second one, it's starting from the number 2 instead of 1.
# 3. 
# A logical vector only consists of values 0 and 1 or True or False
vec <- runif(10, min = 0, max = 3)
vec_more_1.5 <- vec[vec > 1.5]
vec_more_1.5
# 4.
vec_equal_1.2 <- vec[vec == 1.2]
vec_equal_1.2
# I was expecting a 0 because 1.2 is a very specific number to expect in a randomly generated vector
# 5.
?seq
seq(from = 15, to = 1)

# Part 5: Arrays & Matrices
# 1. 
x <- runif(100)
x
# 2. 
matrix_x <- matrix(x, nrow = 10)
matrix_x
dim(matrix_x)
# 3.
y <- matrix(runif(100), 10, 10)
# 4.
# entire column
y[0,]
# entire row
y[,0]
# single element
y[0,1]
# range of rows or columns
y[0:2, 0:4]
# 5. 
t(y)
# 6.
a <- matrix(runif(4), 2, 2)
b <- matrix(runif(4), 2, 2)
a*b # element wise
a %*% b # mathematical matrix multiplication
# 7. 
rm(list=ls())

# Part 6: The Working Directory and R Projects
getwd()
setwd("/home/anirudh/University/E401 Machine Learning For Economic Data/Week 3/problemset1a/r_firststeps_dataset")
vgr = read_csv("vgr.csv")

# Problem Set - 1a

# Question 2: Data Visualization 
mpg <- mpg
diamonds <- diamonds

# Question 2.1: Visualization Basics
ggplot(data = mpg)
# I see a gray box here with no plot being displayed because we aren't providing the structure 
# information of the plot to the ggplot command
?mpg
# The drv variable is short for drive which describes the type of drive mode the car uses. For example,
# front-wheel, drive, rear wheel drive, or 4 = 4wd
ggplot(data = mpg) + geom_point(mapping = aes(x = drv, y = class))
# We see a plot categorizing vehicles into specific categories like SUV, pickup truck based on their drive
# type. However, due to overlapping points, we don't see all 234 vehicle entries, making it challenging to get a
# clear understanding of how the actual number of vehicles are categorized. 

# Question 2.2: Aesthetic Mappings
# 1.
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
# The reason it doesn't show blue colour is because the "color" argument is not part of the command aes. 
# The below line of code shows how it should actually be typed for the colour blue to be used. 
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

# 2.
?mpg
# categorical variables: manufacturer, model, drv, class, trans, fl
# continuous variables: displ, year, cyl, cty, hwy

# 3.
ggplot(mpg, aes(x = displ, y = hwy, colour = cty)) + geom_point()
# cty here is a continuous variable that colours the points from light to dark. Light for points high and 
# Dark for points low. 
ggplot(mpg, aes(x = displ, y = hwy, size = cty)) + geom_point()
# when cty is used for size, the size values become continuous according to the corresponding y value's magnitude

# 4.
ggplot(mpg, aes(x = displ, y = hwy, colour = hwy, size = displ)) + geom_point()
# The issue with mapping a single varialbe to multiple aesthetics is that there is redundancy. So it's best to
# avoid this approach.

# Question 2.3: Facets

#1. 
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point() + facet_grid(. ~ cty)
# If we facet a continuous variable, we can see that it gets converted into a categorical variable.

#2.
ggplot(data = mpg) + geom_point(mapping = aes(x = drv, y = cyl))
ggplot(data = mpg) + geom_point(mapping = aes(x = drv, y = cyl)) + facet_grid(drv ~ cyl)

# The empty cells in this plot are data points in drv vs cyl that have no observations.
# These are the same locations in the scatter plot of drv and cyl that have no points.

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap(~ class, nrow = 2)

# The advantage would be we can encode them into distinct categorical variables
# The disadvantage would be that it makes it difficult to compare the datapoints between categories
# But as the no. of categories increase, differences in colours decrease making it difficult to tell the 
# datapoints apart

# Question 2.4:
# 1. 
# For line chart, geom_line()
# For boxplot, geom_boxplot()
# For histogram, geom_histogram()
# For area chart, geom_area()

#2.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()
ggplot() +
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

# They don't look different because geom point and smooth because the dataset is still the same 

# Part 2: Your Project 
# Question 3:
getwd()
setwd("/home/anirudh/University/E401 Machine Learning For Economic Data/Week 3/problemset1a/part_2_datasets/spotify")
spotify <- read.csv("playlist_2010to2022.csv")
ggplot(data = spotify) + geom_point(mapping = aes(x = duration_ms, y = track_popularity))

# The no.of milliseconds seems to play a role in the songs popularity. It looks like songs which have a duration
# around 200000ms/200s/3.33 minutes are popular. 

musical_attributes <- c("danceability", "energy", "key", "loudness", "mode", "speechiness", "acousticness", "instrumentalness", "liveness", "valence", "tempo")
musical_attributes
ggplot(data = spotify) + geom_point(mapping = aes(x = track_popularity, y = danceability))
ggplot(data = spotify) + geom_point(mapping = aes(x = track_popularity, y = loudness))
ggplot(data = spotify) + geom_point(mapping = aes(x = track_popularity, y = speechiness))
ggplot(data = spotify) + geom_point(mapping = aes(x = track_popularity, y = instrumentalness))

getwd()
setwd("/home/anirudh/University/E401 Machine Learning For Economic Data/Week 3/problemset1a/part_2_datasets/houses")
house <- read.csv("house.csv")
ggplot(data = house) + geom_point(mapping = aes(x = metro_distance, y = price))
ggplot(data = house) + geom_point(mapping = aes(x = bedroom_count, y = price))
ggplot(data = house) + geom_point(mapping = aes(x = age, y = price))
ggplot(data = house) + geom_point(mapping = aes(x = floor, y = price))
