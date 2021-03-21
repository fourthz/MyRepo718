
# Questin #4 R script
 
# (a) Load data------------

Mt_Juniper_data <- read.csv("C:/Jeff/Github/Edrm718Sp21/Exercise Sets/Data/Mt_Juniper_data.csv")

# (b) Check if score column has missing values

is.na(Mt_Juniper_data$Score)

# (c) Using the fxn "anyNA# returns "TRUE" if there are 
# any missing values or FALSE no missing values

anyNA(Mt_Juniper_data$Score)
