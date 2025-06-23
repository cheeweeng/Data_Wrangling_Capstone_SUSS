---
title: 
---

### 🛍️ Data Wrangling Project: Customer Satisfaction Analysis for a New Shopping Mall
[This repository](https://github.com/cheeweeng/Data_Wrangling_Capstone_SUSS) contains the code, SQL queries, and visualisation assets developed and submitted in April 2025 for the End-of-Course Assessment 
Data Wrangling at the Singapore University of Social Sciences (SUSS).   
The project focuses on processing, cleaning, transforming, and visualising survey data collected from mall visitors in 2024.  

## 🎯 Project Objective
To clean, transform, and summarise mall visitor survey data, and provide a monthly summary of customer satisfaction indicators. 
The project tasks include:

1. Importing and storing raw survey data into MySQL
2. Cleaning inconsistent date formats
3. Optimising data types for efficient storage
4. Creating a summary table with monthly averages and derived KPIs
5. Visualising the data for business interpretation  

## 🛠️ Technologies Used  
Language: Python, SQL (MySQL), R   
Packages (R): DBI, RMySQL, ggplot2, dplyr, scales  
Tools: RStudio, MySQL Workbench, Jupyter Notebook  

## Codes Explained
1. Python script to access the dataset and store it as a MySQL table in MySQL database  
<img src="https://github.com/user-attachments/assets/4db3ba6a-166d-40b0-8b09-920812da358b" style="display: block; width: 370;" />

2. MySQL statement to clean up inconsistent date format  
<img src="https://github.com/user-attachments/assets/a07b3a9f-bf7b-4c13-b560-f7aed5068546" style="display: block; width: 250;" />  
<p>In this code, the <code>doi</code> column values have been updated to consistently use <code>YYYY-MM-DD</code> format.</p>

3. Alter Table statement to optimise data type for efficient storage  
<img src="https://github.com/user-attachments/assets/2a23854f-b237-48fb-9d41-89e49b49e587" style="display: block; width: 450px;" />  
<p>For satis, confirm, ideal and handle, these four columns correspond to respondent’s rating on a scale of 1-10.
Therefore, using tinyint is space efficient (1 byte) and UNSIGNED restrict it to a non-negative value with a range of 0 to 255.</p>
<p>For comp, it has an input value of either 0 or 1, hence, using tinyint is also justified for saving storage space.</p>
<p>For nocomp, it has an input value from 1 to 4, hence it is optimal to use tinyint as data type to achieve space efficiency.</p>

4. MySQL statement to create summary table  
<img src="https://github.com/user-attachments/assets/bce6ed6a-94b4-4a2b-912f-1c7075ce92ec" style="display: block; width:400;" />

A new table was created containing 12 rows, one for each month of the year, and 7 columns. The <code>mth</code> column contains an integer representing the month of the year.  
The satis, confirm, ideal, comp, handle columns contain the corresponding month average values for those variables.

5. R code to read in summary table and store it as an R data frame  
<img src="https://github.com/user-attachments/assets/4eca1561-e702-4267-bafb-293274e4b586" style="display: block; width: 450;" />

This R code read in the summary table and store it as an R data frame.

6. R code for visualization  
<img src="https://github.com/user-attachments/assets/19f24de3-590e-4667-8651-0854c0cdb1cf" style="display: block; width: 450;" />

A single visual was created to make it easy for the mall manager to understand the information in the table.

## Visualisation
<img src="https://github.com/user-attachments/assets/6dd353dd-4d2a-424f-a8b5-a371282363e0" alt="Image" width="750" />  

<div style="text-align: justify;">To visualize multiple variables of different scales over time (months) from the ECA_summary dataset, I evaluated options like a dual-axis line chart and a facet grid of line charts, as suggested by ChatGPT. 
The advantages of a dual-axis line chart are it could plot the six variables in ECA_summary in one single chart as separate lines in different colors and the x-axis representing the months.
The dual y-axes will take care of the different scale of the variables, TNCR in percentage and the other variables in scale of 0-10.
The disadvantages of a dual-axis line chart are that it could become cluttered to have six different variables in a single chart, especially if the lines overlapped. Furthermore, the dual y-axes will add to the clutter and confuse viewer due to the different scale.
On the other hand, the advantages of a facet grid of line chart are clutter-free individual chart for each variable and reduce confusion as it is easier to read and interpret as there is only one y-axis.
The disadvantages of a dual-axis line chart are that it is harder to compare the different variables since they are in sperate panels and less likely for user to spot correlation between the variables.
In conclusion, I have chosen a facet grid of line charts as it offers clutter-free and easy to understand visualization, especially without the dual axes to add to the chart clutter. In addition, the customer experience manager of the mall is likely to want to view the individual variable on its own and very rarely will require to compare those variables against each other.
</div>


Back to [Project main page](https://cheeweeng.github.io)
