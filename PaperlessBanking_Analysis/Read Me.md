## Title: Analysis of Paperless Banking Enrollment at Sandhills Bank

### Author: Saakshi Agarwal

## Overview

This study investigates the relationship between customer balance and paperless banking enrollment at Sandhills Bank, with the goal of predicting which customers are most likely to adopt paperless banking. The dataset includes 1,000 customer observations, using balance as the continuous independent variable and enrollment status as the binary dependent variable (enrolled or not enrolled). A logistic regression model is applied to identify high-probability customers, enabling the bank to target marketing efforts effectively and boost adoption rates.

## Data Description

The dataset includes:
1. **Balance**: Total customer balance in dollars (continuous variable).
2. **Enroll**: Binary variable indicating paperless banking enrollment (“Yes” or “No”).
3. Additional variables like **Age** and **Customer** are present but not the primary focus of the analysis.

## Exploratory Data Analysis (EDA)

EDA involved summary statistics and visualizations to explore the relationship between balance and enrollment:

**Summary Statistics of Balance by Enrollment Status**

| Enroll | Min (Dollar) | Q1 (Dollar) | Median (Dollar) | Mean (Dollar) | Q3 (Dollar) | Max (Dollar) |
|--------|--------------|-------------|-----------------|---------------|-------------|--------------|
| Yes    | 365          | 898         | 1045            | 1122          | 1307        | 2726         |
| No     | 76           | 365         | 507             | 510.7         | 638.5       | 2498         |

- Enrolled customers have a higher mean balance ($1,122) and median ($1,045) compared to non-enrolled customers (mean: $510.7, median: $507).
- The minimum balance for enrolled customers ($365) is over twice that of non-enrolled ($76).

**Visualizations**
1. **Boxplot**: Shows a wider interquartile range (IQR) for enrolled customers, indicating greater variability in balances. Some non-enrolled customers have high balances.
2. **Density Plot**: Illustrates balance distribution differences between enrolled and non-enrolled customers.
3. **Sigmoid Curve**: Depicts the probability of enrollment increasing with balance.

## Key Findings
1. **Balance as a Predictor**: Higher balances strongly correlate with enrollment in paperless banking.
2. **Significant Differences**: Enrolled customers exhibit higher and more varied balances than non-enrolled customers.
3. **Model Performance**: The logistic regression model achieves 92% accuracy and high sensitivity (96.5%), effectively identifying enrolled customers.
4. **Targeting Strategy**: Focusing on non-enrolled customers with balances above $1,000 can enhance adoption rates and marketing efficiency.

## Logistic Regression Model

The logistic regression model predicts enrollment probability based on balance:

**Model Equation**:  
`p̂ = 1 / (1 + exp(-(-7.98 + 0.00944 * Balance)))`

- **Intercept**: -7.98 (p-value < 0.001)
- **Balance Coefficient**: 0.00944 (p-value < 0.001)
- **Odds Ratio**: For every $1 increase in balance, odds of enrollment increase by 0.9% (odds ratio = 1.009).

The model indicates that enrollment probability rises sharply around $1,000 and nears 100% above $1,500 (e.g., 99.8% probability at $1,500).

## Model Evaluation
- **Performance Metrics**:
  - **Accuracy**: 92.0%
  - **Sensitivity**: 96.5% (excellent at identifying enrolled customers)
  - **Specificity**: 82.6% (moderate at identifying non-enrolled customers)
  - **Positive Predictive Value (PPV)**: 92.1%
  - **Negative Predictive Value (NPV)**: 91.7%
  - **AUC**: 0.973 (strong discriminatory power)

**Confusion Matrix**  
|                     | Actual: No | Actual: Yes |
|---------------------|------------|-------------|
| **Prediction: No**  | 328        | 28          |
| **Prediction: Yes** | 12         | 133         |

- True Negatives: 328, True Positives: 133, False Negatives: 28, False Positives: 12.

## Model Visualizations
1. **Sigmoid Curve**: Probability of enrollment increases sharply from $1,000 onwards.
2. **ROC Curve**: AUC of 0.973 confirms excellent model performance.
3. **Boxplot**: Highlights balance distribution differences by enrollment status.

## Model Performance

The model was trained using a 70% training and 30% testing split to preserve the proportion of paperless banking users and non-users. The performance metrics, including accuracy, sensitivity, specificity, and AUC, highlight the effectiveness of the logistic regression model in paperless banking users.

## Conclusion

The analysis confirms that balance is a statistically significant predictor of paperless banking enrollment. High-balance customers (especially above $1,000) are prime targets for promotional campaigns. The model’s high accuracy and sensitivity make it a reliable tool for Sandhills Bank to optimize marketing efforts and increase paperless adoption.

## R Script

The provided R script loads the dataset, performs exploratory data analysis, fits a logistic regression model, and evaluates the model’s performance. Key steps in the script include:
	•	Reading the dataset and inspecting its structure.
	•	Preprocessing the data (handling missing values, converting categorical variables).
	•	Visualizing spending distributions using boxplots, histograms, and density plots.
	•	Splitting the data into training and testing sets.
	•	Fitting the logistic regression model.
	•	Evaluating model performance using a confusion matrix, ROC curve, and AUC.

## RScript Requirements

To run the analysis and the R script, the following packages are required:
	1.	dplyr: For data manipulation.
	2.	tidyverse: For data visualization and other utilities.
	3.	ggplot2: For plotting graphs.
	4.	tidymodels: For model building and evaluation.
	5.	yardstick: For performance metrics like accuracy, sensitivity, specificity, and AUC.

You can install these packages using the following command:

	install.packages(c("dplyr", "tidyverse", "ggplot2", "tidymodels", "yardstick"))

Installation and Usage
1.	Install the required packages:

		install.packages(c("dplyr", "tidyverse", "ggplot2", "tidymodels", "yardstick"))


2.	Load the required libraries:

		library(dplyr)
		library(tidyverse)
		library(ggplot2)
		library(tidymodels)
		library(yardstick)


3.	Load the dataset:

   sandhills Bank <- read_csv("path_to_Sandhills.csv")


4.	Run the analysis script to generate visualizations and model evaluations.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.


## Acknowledgments
- This project was completed as part of a Master’s program project at the [University of Auckland](https://www.auckland.ac.nz/en.html). Special thanks to the University of Auckland for the opportunity to undertake this project and for their invaluable support.
