# Grain Dataset Analysis
This project involves the analysis and manipulation of the Grain dataset using R programming language. The dataset contains information about land-grab deals and related details.

# Dataset Description
The dataset used for this analysis is sourced from the "GRAIN - Land-grab deals - Jan-2012-2" Excel file. The file consists of two sheets, each containing different aspects of the land deals. The data includes variables such as the year, country, investor, status of the deal, hectares of land, projected investment, and more.

# Purpose
The purpose of this project is to perform various data manipulation and analysis tasks on the Grain dataset. The steps include cleaning the data, handling missing values, removing outliers, and creating visualizations to gain insights into the dataset.

# Prerequisites
To run the code in this project, you need to have the following R packages installed:

dplyr: A package for data manipulation and transformation.
readxl: A package for reading Excel files.
ggplot2: A package for creating visualizations.

# Usage
Ensure that you have the necessary packages installed by running the following code:

install.packages("dplyr")
install.packages("readxl")
install.packages("ggplot2")

Set the correct file path in the read_excel function to access the Excel file containing the Grain dataset.

# Run the provided R code to perform the following tasks:
Load the required packages.
Read the data from the Excel file into separate data frames (grain_df1 and grain_df2).
Combine the data frames into a single data frame (df_grain).
Rename columns.
Convert the "Year" column to numeric.
Remove duplicates.
Replace missing values with means.
Replace NAs in the "Project_investment" column with 0.
Handle missing values using na.omit.
Remove outliers based on the "Hectares" column.
Create a box plot and histogram visualization of the cleaned dataset.
The cleaned dataset, df_grain_outliers, will be exported as a CSV file named "cleaned_grain_dataset.csv" in the current working directory.

# Results
The results of the analysis include a cleaned and processed dataset (df_grain_outliers) and visualizations of the dataset's distribution and outliers.

Box Plot: The box plot visualizes the distribution and outliers in the "Hectares" column.

Histogram: The histogram provides insights into the distribution of hectares across the dataset.






