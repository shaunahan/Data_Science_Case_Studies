# Wine Quality Prediction 

For this project, I used UCI’s Red Wine Quality dataset to build various classification models to predict whether a particular red wine is “good quality” or not. Dataset: (https://archive.ics.uci.edu/ml/datasets/Wine+Quality ) <br>
Each wine in this dataset is given a “quality” score between 3 and 8. For the purpose of this project, I converted the output to a binary output where each wine is either “good quality” (a score of 6, 7, 8) or not (3,4,5). <br>
<br>
# About the Dataset 
There are 1599 instances in the dataset and with 12 columns. The final column is the ‘Quality’ which is used as target variable. <br>
The quality of a wine is determined by 11 input variables:
<br><br>
Fixed acidity <Br>
Volatile acidity<Br>
Citric acid<Br>
Residual sugar<Br>
Chlorides<Br>
Free sulfur dioxide<Br>
Total sulfur dioxide<Br>
Density<Br>
pH<Br>
Sulfates<Br>
Alcohol
<Br>
  
# Objectives
The goals of this project are: <Br>
1. To experiment with different classification methods to see which yields the highest accuracy<br>
2. To determine which features are the most indicative of a good quality wine <br>

  
# Modelling
  
For this project, I compared 8 different machine learning models, such as Random Forest Classifier, Multi Layer Perceptron, Gradient Boosting Classifier, Decision Tree, SVM, Logistic Regression, K Nearest Neighbors, and Gaussian NB. 
<br>
![image](https://user-images.githubusercontent.com/90071614/181048123-fc5a4d7e-3a20-4580-9b72-aeab652ac2fa.png)

In my models, Random Forest Classifier gave the highest accuracy of 78% , followed by Multi Layer Perceptron and Gradient Boosting Classifier.
