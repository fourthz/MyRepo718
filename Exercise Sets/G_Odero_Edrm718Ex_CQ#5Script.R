install.packages("pacman")
library("pacman")



# Question #5). **Write a script to conduct an analysis of 
  # variance to determine if you can infer 
  # different score means for the three different 
  # grade levels at Mount Juniper Elementary. (Caution: Look at
  # the degrees of freedom for grade level to make certain you are
  # doing this correctly.) (10 points)**

# Load data--------------

Mt_Juniper_data <- read.csv("C:/Jeff/Github/Edrm718Sp21/Exercise Sets/Data/Mt_Juniper_data.csv")

# convert Grade to factor and then fit the ANOVA model


Mt_Juniper_data$Grade <- factor(Mt_Juniper_data$Grade,
                                levels = c(3, 4, 5),
                                labels = c("Third", "Fourth", "Fifth"),
                                ordered = TRUE)

levels(Mt_Juniper_data$Grade)

# Lets visualize the data

boxplot(Mt_Juniper_data$Score ~Mt_Juniper_data$Grade,
        xlab = "Grade",
        ylab = "Score")

# fit the model

anova(lm(Mt_Juniper_data$Score ~ Mt_Juniper_data$Grade))

