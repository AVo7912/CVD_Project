# Support Vector Model (SVM) model 

## Overview:

### Purpose

The purpose of the analysis here is to create a machine learning Model that is able to accurately predict heart disease in the patients of the provided dataset. The model that we will create for the prediction of our target variable is Support Vector Machines (SVM) model. Support Vector Machine (SVM) is a powerful, versatile machine learning model, capable of performing linear or nonlinear classification, regression, and even outlier detection. It's particularly well-suited for classification of complex but small- or medium-sized datasets.

Steps I followed to create model using SVM model are following:

- After importing the dependencies and reading the dataset into google collabratory, some exploratory analysis are done. 
- Before we create a model,the dataset is split into training and testing data.
- Now model is created using 'kernel = rdf' parameter and then we fit the model with our training data.
- Finally we make predictions using our testing dataset on the trained model and evaluate the model by checking the accuracy along with  precision, recall , f1 score and other with our classification report. 

### conclusion with basic SVM model:


Our model here gives the good accuracy of 92 % . The classification report above having a good precision of 0.92 and 1.00 displays that the model is highly effective at identifying class 0, which is column with NO heart disease or patients with negative results. However, it fails to recognize class 1, which is  patients with positive herat disease.  The precision, recall, and F1-score for class 1 are all 0.00, indicating the model did not correctly identify any instances of class 1. The report suggests that model's high performance at the majority is misleading in this context because of the significant class imbalance (70,955 for 0 > 6,259 for 1) suggesting a need to improve  the model , such as resampling by SMOTE.

# Optimization 1: 

## SVM Model with SMOTE 

### Conclusion:

After applying the SMOTE our overall accuracy went down to 78% . However the classification report above displays that the precision score for class 0 (negative class / No heart Disease) is increased to 96% whereas the precision score for class 1 (positive class/Yes Heart Disease) increased to 20%, which is better compared to our original model, but not so good looking at low recall f1 score for class 1 and 0 both. Likewise, if we look at our confusion matrix we see that the model does predict the 'true negative' result in pretty good numbers, i.e, 56,205, however; the 'true positive' significantly low, i.e, 3,691. Likewise,the number of 'false negative', 2568 which is low , however; the number of false positive', which is 14,750 is also very high. In this way,considering the errors in heart disease diagnosis, specially inaccurately identifying 'true positive' could be fatal for many patients, suggesting us this is not an ideal model to go with.

# Optimization 2

## SVM Model with Manually specifying the class weights (Here we are manually specifying the weights of class '0' and class '1'. By giving the class '1' ten fold weights than class '0', we will improve our model in order to get the better results.)

### Conclusion:

Here after the weights respecifying , the accuracy reduced to 74% . The classfication report displays that the model now correctly identifies class '0'/ negative class, 97% of the time, while the precision for class 1/positive class is only increased to 21%. Likewise, the recall values and f1 score overall for both classes are little better but not yet satisfactory.The model still demonstrates an excellent ability to identify class 0 , which is patients with no heart disease instances accurately but still struggles to do so without generating a large number of false positives for class 1 which is patients with actual heart disease.

# Optimization 3: 

## SVM Model with balanced class weights ("model = SVC(kernel='rbf', class_weight='balanced'"))

### conclusion:

After the evaluation, we see the accuracy even droped to 71% . The classification report above again suggests that the model predicted (class '0'), people with no heart disease correctly (high precision) but tends to misclassify a notable portion of them as (class '1') people with heart disease . Though the recall is higher than before but the significant difference between the model's performance metrics for classes 0 and 1 still suggests issues with model bias, potentially due to class imbalance. In summary , while SMOTE and balanced class weights are powerful tools for combating class imbalance, their effectiveness can be influenced by the quality of features, the choice of model and its complexity, and the underlying data distribution. Further explorations and adjustments in these areas might be required to achieve significant improvements. Another strategy would be to try ensemble methods designed to handle imbalanced data, like Balanced Random Forest or EasyEnsemble.

Thank you !


Author

Stuti Poudel