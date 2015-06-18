Components of run_analysis.R file:
---------------------------------
1) All data with similar qualities are combined using rbind() function. Similarity here means the datasets with same column numbers and same entities.

2) Extracting only the mean and standard deviation for each measurement from the dataset and providing the correct coliumn from features file.

3) we take the activity ids and names from the activity file and substitute it in the data set.

4) Colomns with confusing names are corrected.

5) We generate a new data set with average measures for each subject and activity are generated.the file name :AvgVar_TidyData.txt id uploaded in this repository.

variable Description:
----------------------------------------
1) x_train,y_train,subject_train,x_test,y_test,subject_test- containd data from downloaded data files

2) x_data,y_data,subject_data- contains merged data

3) features contains the correct column names for x_data dataset applied to the mean_and_std_features a object which contains only mean and standard deviation extracted for the analysis.

4) y_data[, 1]- renaming y data with the names in the activity file.

5) single_dataset- merges x_data, y_data and subject_data in a big dataset.

6) AvgVar_TidyData:independent tidy data set with the average of each variable for each activity and each subject which will be stored in a text file.

