library(ggplot2)  
#Learning about the dataset
?ToothGrowth

#checking the dataset
ToothGrowth

#finding descriptive analysis for numeric variable length
summary(ToothGrowth$len)

#finding IQR for numeric variable length
IQR(ToothGrowth$len)

#creating frequency table for supplement type
table(ToothGrowth$supp)

#finding descriptive analysis for numeric variable length based on supplement type
by(ToothGrowth$len,ToothGrowth$supp,summary)

#finding IQR for numeric variable length based on supplement typ
by(ToothGrowth$len,ToothGrowth$supp,IQR)

#Density plot for length vs supplement type
ggplot(ToothGrowth, aes(x = len, fill = supp)) +
  geom_density(alpha = 0.5,color = "black", size = 0.2) +
  labs(title = "Density Plot of Tooth Length by Supplement Type",
       x = "Tooth Length (mm)",
       y = "Density",
       fill = "Supplement Type") +
  theme_minimal()+
  theme(
      plot.title = element_text(hjust = 0.5),  # Centers the title
      panel.border = element_rect(color = "black", fill = NA, size = 1) )  # Adds a border around the panel)

#Boxplot for length vs supplement type
ggplot(ToothGrowth, aes(x = supp, y = len, fill = supp)) +
       geom_boxplot(color = "black", size = 0.2) +  # Adds a black border around the boxplot
       labs(title = "Tooth Length by Supplement Type",
            x = "Supplement Type",
            y = "Tooth Length (mm)") +
    theme_minimal() +
       theme(
    plot.title = element_text(hjust = 0.5),  # Centers the title        
    panel.border = element_rect(color = "black", fill = NA, size = 1) ) # Adds a border around the panel)
