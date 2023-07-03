install.packages("dplyr")
library(dplyr)
install.packages("readxl")
library(readxl)
install.packages("ggplot2")
library(ggplot2)
install.packages("hunspell")
library(hunspell)

grain_df1 <- read_excel("C:/Users/ragha/Documents/syllabus/ANA_515/practicum/GRAIN---Land-grab-deals---Jan-2012-2.xlsx" , sheet = 1)

grain_df2 <- read_excel("C:/Users/ragha/Documents/syllabus/ANA_515/practicum/GRAIN---Land-grab-deals---Jan-2012-2.xlsx" , sheet = 2)

grain_df1$Year <- as.character(grain_df1$Year)
grain_df2$Year <- as.character(grain_df2$Year) 

#combine the data
df_grain <- bind_rows(grain_df1,grain_df2)

head(df_grain)
summary(df_grain)
str(df_grain)

#Rename the coloumns
df_grain_rename <- df_grain %>% rename(Project_investment = `Projected investment` , Status_of_deal = `Status of deal`)

#Convert coloum to numeric type
df_grain_rename$Year <- as.numeric(df_grain_rename$Year)

#Remove duplicates
df_grain3 <- unique(df_grain_rename)

#Replacing missing value with mean
df_grain2 <- df_grain3 %>% mutate_if(is.numeric , ~ifelse(is.na(.), mean(., na.rm = TRUE), .))

#Replacing Na value with 0
df_grain2$Project_investment <- replace(df_grain2$Project_investment, is.na(df_grain2$Project_investment), 0)

#handeling the missing values
df_grain1 <- df_grain2 %>% na.omit(df_grain2)
  
#Removing outliers
df_grain_outliers <- df_grain1[df_grain1$Hectares < 3100000, ]

#Box plot
df_plot <- ggplot(df_grain_outliers, aes(x = 1, y = Hectares)) +
  geom_boxplot(color = "skyblue") +
  ggtitle("Outliers in Numeric Column")

#Histogram
histogram_plot <- ggplot(df_grain_outliers, aes(x = Hectares)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Hectares",
       x = "Number of Hectares",
       y = "count")


write.csv(df_grain_outliers, "cleaned_grain_dataset.csv", row.names = FALSE)


