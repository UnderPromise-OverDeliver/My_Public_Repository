# My_Public_Repository

As one of my projects in the Big Data course I have taken I would like to share a small piece of code I generated with my team

Big Data sometimes requires using super computers and clusters to help running some methods. 

Unfortunately, due to some constraints, we decided to utilize a simple (yet still powerful) method Principal Component Analysis (PCA)

A specific reason for this method choice was that we were looking for a method to reduce the dimensionality of a big dataset we were required to work with. 

#Project_Description
A large data set with dimenstions 92x54669 was given to work with. To not make it a long description and be as useful to general as possible, I will describe the structure of the data and task we were required to complete. 
54668 of 54669 variables were the variables and a last column was a binary response variable with values 0 and 1. Some of the values in the last column was hidden (NA) on purpose to present them as data to be predicted. 

I have omitted the part of the code where we subset the train data since it might not be applicable for other datasets. Thus the code I provide assumes that the data given to users is already set up for PCA being applied directly

Most of the code is also explained with comments so I hope it will be easy enough to understand it




