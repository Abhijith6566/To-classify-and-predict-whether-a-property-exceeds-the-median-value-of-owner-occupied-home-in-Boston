   
   **Goal**
   To classify and predict whether a property exceeds the median value of owner occupied home in Boston.
   
   **Data Used **
   
   This data set is collected from one of the kaggle competition.
   
   **Packages Used**
   
   ggplot,tidyverse, dplyr, caret, randomforest,Islr
   
   **Techniques**
   
   Data manipulation, Random Forest, SVM linear, SVM Radial
   
   **IDE**
   
   R studio
   
   **Evaluation metric**
   
  To validate these models used Confusion matrix, Kappa statistic
  
  **Steps Included**
  
  1. Check the Summary of data set
  2. Check for any irregularities and missing data
  3. Train and Test split 70:30
  4. Use Randomforest model with best mtry
  5. Validate the model using test data set
  6. Run SVM linear function on train data in default setting
  7. Run SVM kernel function on train data in default setting
  8. Validate these models on test data and compare these classifiers by checking kappa statistic, confusion matrix
  9. Choose the better classifier among Random Forest , SVM linear kernel, SVM radial Kernel
  
  **Conclusion**
  
  Random forest classifies better than SVM. We are able to predict whether a house exceeds median value or not with 97% accuracy. 
  
   
   
