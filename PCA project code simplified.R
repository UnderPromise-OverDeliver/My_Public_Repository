
#Principal Component Analysis brief ftutorial

#both of these datasets assumed to have exactly same structure except for the last variable to be present and missing for train and test set respectively
train = read.table("train.txt")
test = read.table("test.txt")

#run a PCA, summary includes total number of PC ordered in descending proportion for variance explained, percentage of variability explained by each PC, cumulative variability of data explained by up to and including a corresponding PC
prin_comp = prcomp(train)
summary(prin_comp)

#to check the plot to decide how many PC to use
#this is the visual representation of the PCs at display.
std_dev = prin_comp$sdev
pr_var = std_dev^2
prop_varex = pr_var/sum(pr_var)
plot(cumsum(prop_varex), xlab = "Principal Component",
     ylab = "Cumulative Proportion of Variance Explained",type = "b")

#create a data frame for logistic regression
train.data = data.frame(pred = train$last_column, prin_comp$x)
#here k would be a desired number of PC you would want ot use to train a model
train.data = train.data[,1:k]
#for more details about the options as well as other possible options glm can take look up in google C-RAN project documentation for glm()
log.model = glm(pred~., data = train.data, family = "binomial", maxit = 100)

test = test[ , -Last-Column] 
test.data = predict(prin_comp, newdata = test)
test.data = as.data.frame(test.data)
test.data = cbind(test.data,test$Last_Column)
log.pred = predict(log.model, test.data, type = "response")
View(log.pred)

test$Value = log.pred

write.csv(test, file = "predictions", row.names = FALSE)

#Most of the code has been created based on the blogpost I found very useful
#https://www.analyticsvidhya.com/blog/2016/03/practical-guide-principal-component-analysis-python/