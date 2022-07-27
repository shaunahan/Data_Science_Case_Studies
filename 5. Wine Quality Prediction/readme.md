# Wine Quality Prediction 

For this project, I used UCI’s Red Wine Quality dataset to build various classification models to predict whether a particular red wine is “good quality” or not. <br>
Each wine in this dataset is given a “quality” score between 3 and 8. For the purpose of this project, I converted the output to a binary output where each wine is either “good quality” (a score of 6, 7, 8) or not (3,4,5). <br>
<br>
## About the Dataset 
Dataset: (https://archive.ics.uci.edu/ml/datasets/Wine+Quality ) <br>
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
  
## Objectives
The goals of this project are: <Br>
1. To experiment with different classification methods to see which yields the highest accuracy<br>
2. To determine which features are the most indicative of a good quality wine <br>

  
## Data Preprocessing
First, I removed outliers using the z-score method, then with cleansed dataset, I observed correlations between different features. <br>
I then converted the response variable (quality) into a binary form (good / bad quality). This time, I looked at the relationship that different features (chemicals) have on  quality, examined the most important features among the variables (Alcohol and sulphates have high correlation with the quality of wine), and also looked into the multicollinearity between features using varianceinflation factor.  <br>

## Modelling
  
For this project, I compared 8 different machine learning models: Random Forest Classifier, Multi Layer Perceptron, Gradient Boosting Classifier, Decision Tree, SVM, Logistic Regression, K Nearest Neighbors, and Gaussian NB. Prior to building models, I scaled the train and test sets, and examined the optimal k-values (n_neighbors) for KNN Classifier; I looked at the k-value with lowest error rate and the highest accuracy, which was 8 for my KNN model. Then I found the best random features for each model. <br><br>
  
Upon running the ML models, Random Forest Classifier had the highest accuracy score. To validate this claim, I ran the models again using cross validation. 
The CV Mean Score also concided with our previous result, confirming our claim that Random Forest Classifier is the best model for classifying the quality of the red wine. To complete the random forest model, I used hyper-parameter tuning using gridsearchCV. The final test score gave 81% accuracy, which is pretty good! Also, this test score is parallel with the AUC score result. <br><br>

![image](https://user-images.githubusercontent.com/90071614/181383597-19dfaf82-eab8-4a6f-a62f-9038cc78f60a.png)

![image](https://user-images.githubusercontent.com/90071614/181383621-14b7995c-82bc-4e80-bf3a-90994cbbcabe.png)

