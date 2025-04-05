## **Project Title**: The Analysis of Tooth Growth in Guinea Pigs by Supplement Type

### **Author**: Saakshi Agarwal


## **Overview**

This analysis explores the *ToothGrowth* dataset in R, which examines the impact of vitamin C on tooth growth in guinea pigs. The dataset includes 60 observations and focuses on two variables: **length** (tooth length in millimeters) and **supplement type**—either Orange Juice (OJ) or Ascorbic Acid (VC). The primary goal is to analyze the difference in tooth growth between these two supplement types.


## **Key Findings**

### 1. Tooth Length Distribution  
- The **median** tooth length is **19.25 mm**, indicating that half the guinea pigs experienced less than this amount of growth.  
- The **mean** is **18.81 mm**, slightly lower than the median, suggesting a **left-skewed** distribution.  
- This skewness is caused by a few guinea pigs with very low tooth growth (e.g., 4.2 mm).  
- The **IQR** spans from **13.07 mm** to **25.27 mm**, showing moderate variability in growth.


### 2. Supplement-wise Analysis  
- **Orange Juice (OJ)**:
  - Shows higher **mean (20.66 mm)** and **median (22.70 mm)** growth values.
  - Tooth lengths are more **concentrated**, with lower variability (IQR = 10.2 mm).
  - Majority of values lie in the **25–30 mm** range.

- **Ascorbic Acid (VC)**:
  - Lower average growth (**mean: 16.96 mm**, **median: 16.5 mm**).
  - Greater **variability** (IQR = 11.9 mm), and wider range of outcomes.
  - Some guinea pigs had extremely low (**4.2 mm**) or unusually high (**33.9 mm**) growth.

### 3. Density Plot Analysis  
- **OJ** shows a peak in the **25–30 mm** range, indicating **stronger and consistent growth**.
- **VC** peaks in the **15–20 mm** range but with more spread and outliers.
- Density plots suggest that **OJ is more effective** than VC in promoting tooth development.


## **Dataset**

The dataset used in this analysis is the **ToothGrowth** dataset, available in R. It contains the following relevant columns:  
1. **supp**: Supplement type (OJ or VC)  
2. **len**: Tooth length in millimeters  


## **Statistical Summary**

### Overall Tooth Length Distribution

| Statistic          | Value   |
|--------------------|---------|
| Minimum            | 4.2 mm  |
| 1st Quartile (Q1)  | 13.07 mm |
| Median             | 19.25 mm |
| Mean               | 18.81 mm |
| 3rd Quartile (Q3)  | 25.27 mm |
| Maximum            | 33.9 mm  |


### Supplement-wise Statistics

| Supplement Type | Min   | Q1     | Median | Mean  | Q3    | Max   | IQR   |
|------------------|--------|--------|--------|--------|--------|--------|--------|
| Orange Juice (OJ) | 8.2 mm | 15.2 mm | 22.7 mm | 20.66 mm | 25.4 mm | 30.9 mm | 10.2 mm |
| Ascorbic Acid (VC)| 4.2 mm | 11.2 mm | 16.5 mm | 16.96 mm | 23.1 mm | 33.9 mm | 11.9 mm |


## **Visualizations**

- **Density Plot (Fig 1.1)**: Shows distribution of tooth lengths by supplement type, highlighting the difference in growth outcomes.  
- **Boxplot (Fig 1.2)**: Visualizes the spread, median, and outliers in tooth length for OJ and VC groups.



## **R Code for Analysis**

### 1. Loading Necessary Libraries & Dataset
```R
library(ggplot2)
data(ToothGrowth)

# View dataset structure
head(ToothGrowth)
str(ToothGrowth)
colnames(ToothGrowth)
table(ToothGrowth$supp)
```


### 2. Summary Statistics
```R
summary(ToothGrowth$len)   # Overall summary
by(ToothGrowth$len, ToothGrowth$supp, summary)   # Summary by supplement
```


### 3. Spread & Variability
```R
by(ToothGrowth$len, ToothGrowth$supp, sd)     # Standard deviation by supplement
tapply(ToothGrowth$len, ToothGrowth$supp, IQR) # IQR by supplement
tapply(ToothGrowth$len, ToothGrowth$supp, range) # Range by supplement
```


### 4. Visualizing Data

**Density Plot**
```R
ggplot(ToothGrowth, aes(x = len, fill = supp)) + 
  geom_density(alpha = 0.5, color = "black", size = 0.7) +
  labs(title = "Density Distribution of Tooth Length by Supplement Type",
       x = "Tooth Length (mm)", 
       y = "Density") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 12)
  )
```

**Boxplot**
```R
ggplot(ToothGrowth, aes(x = supp, y = len, fill = supp)) + 
  geom_boxplot(alpha = 0.5, color = "black", size = 0.7, outlier.colour = "red", outlier.size = 3) +
  labs(title = "Tooth Length by Supplement Type",
       x = "Supplement", 
       y = "Tooth Length (mm)") +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12, face = "bold"),
    axis.text = element_text(size = 12)
  )
```


## **Requirements**

- R version 4.0+  
- `ggplot2` package


## **License**

This project is licensed under the MIT License. You are free to use, modify, and distribute the code with proper attribution to the author.


## **Acknowledgments**

- This project was completed as part of a Master’s program project at the [University of Auckland](https://www.auckland.ac.nz/en.html). Special thanks to the University of Auckland for their support and guidance.
