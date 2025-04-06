## Greenhouse Gas Emissions: Influence of Methane and CO2

### Author: Saakshi Agarwal

## Overview
This analysis explores the relationship between total greenhouse gas emissions (GHG) in kilotons of CO₂ equivalent (kt of CO₂-eq) and two major environmental contributors: CO₂ emissions (tons per capita) and methane emissions (kt of CO₂-eq). The dataset used is wdi_2020, containing 217 observations from the World Bank’s World Development Indicators. CO₂ and methane were selected as independent variables due to their significant impact on climate change.

## Dataset

The dataset wdi_2020.csv contains 217 observations, with the following columns relevant to this analysis:
	•	CO₂ Emissions per Capita: CO₂ emissions per capita in metric tons.
	•	Greenhouse Gas Emissions (GHG): Total emissions in kt of CO₂-eq.
	•	Methane Emissions (METH): In kt of CO₂-eq.

## Data Cleaning

The original dataset had 33 missing values in key columns. These entries were removed to ensure a clean dataset for analysis.

## Data Transformation

The raw GHG, CO₂, and methane data showed significant skewness due to wide-ranging values across countries. Logarithmic transformation was applied to all three variables to normalize their distributions and reduce heteroscedasticity.

## Analysis

### Correlation Analysis

The correlation analysis between the transformed variables revealed strong relationships:
	•	GHG and Methane: A strong positive correlation of r = 0.956, indicating that methane emissions are a major contributor to overall greenhouse gas emissions.
	•	GHG and CO₂: A moderate positive correlation of r = 0.257, suggesting CO₂ also contributes to GHG levels, but to a lesser extent than methane.

Figures:
	•	Figure 1a: Pairwise Correlation of All the Key Factors.
	•	Figure 1b: Pairwise Correlation for Logarithmic Variables.

### Regression Model

A multiple linear regression model was built to predict CO₂ emissions using GDP and WAP as predictors. The regression equation is:

Ŷ = 0.82 + 0.31*log(CO₂) + 0.92*log(Methane)

Where:
	•	x_1 represents log of CO₂ emissions per capita
	•	x_2 represents log of Methane emissions (kt of CO₂-eq)

Key findings from the model:
	•	Interpretation of Coefficients:
	  •	Holding methane constant, a 1% increase in CO₂ results in a 0.316% increase in GHG.
	  •	Holding CO₂ constant, a 1% increase in methane leads to a 0.921% increase in GHG.
	•	The model explains 95.15% of the variability in GreenHouse Gas emissions, with a p-value < 2.2 × 10⁻¹⁶ indicating strong statistical significance.
	•	Residual standard error: 0.26, suggesting a reliable fit.

Table:
	•	Table 1: Summary Statistics of the Linear Regression Model.

Figure:
	•	Figure 1.3: Residual Plot Assessing the Impact of Economic Factors on GreenHouse Gas Emissions.

### Assumptions of Linear Regression

The assumptions for linear regression were checked:
	•	Homoscedasticity: The residuals are randomly scattered around zero, confirming no patterns in variance.
	•	Normality: The residuals follow an approximately normal distribution, supporting the assumption of normality for valid statistical inference.
	•	Linearity: Scatterplots show a linear relationship between the independent variables, confirming the suitability of a linear regression model.

### Code Walkthrough

	# Installing and loading the required libraries for data manipulation, visualization, and modeling
	install.packages(c("dplyr", "ggplot2", "cowplot", "GGally"))
	library(dplyr)        # For data manipulation
	library(ggplot2)      # For creating plots
	library(cowplot)      # For combining plots
	library(GGally)       # For creating pairwise plots

	# Load the dataset into R
	ds <- read.csv("C:\\Users\\saaks\\Downloads\\wdi_2020.csv")

	# Rename columns for clarity
	ds <- ds %>%
  	rename(
    CO2_Emissions = EN.ATM.CO2E.PC,
    Methane = EN.ATM.METH.KT.CE,
    Greenhouse_Gas= EN.ATM.GHGT.KT.CE,
  )

	# Check dataset structure
	str(ds)

	# Data Cleaning - Removing missing values
	ds <- na.omit(ds)
	
	# Log transformation for key variables
	logCO2 <- log10(ds$CO2_Emissions)
	logGH = log10(GHG$Greenhouse_Gas)
	logME = log10(GHG$Methane)
	
	# Adding transformed variables to dataset
	ds <- cbind(ds, logCO2 = logCO2, logGH = logGH, logME = logME)
	
	# Linear regression model
	llm <- lm(logGH ~ logCO2 + logME, ds)
	summary(llm)

## Visualization

Pairwise Correlation Plots

The pairwise plots are used to visualize the relationships between GHG emissions, CO2, and Methane:
	•	Figure 1a: Pairwise correlation of the original variables.
	•	Figure 1b: Pairwise correlation after log transformation.

Residual Diagnostics

Diagnostic plots for residuals were created to assess the model’s assumptions:
	•	Residuals vs Fitted Values (Figure 1.3)
	•	Residuals vs Log(Working Population).
	•	Residuals vs Log(GDP per Capita).
	•	Distribution of Residuals.

These plots ensure that the regression model satisfies the assumptions of homoscedasticity, normality, and linearity.

Combined Diagnostic Plots

##### Combining diagnostic plots for easy comparison 
			cowplot::plot_grid(p0, p1, p2, p3)

## Conclusion

The analysis highlights the dominant role methane plays in driving greenhouse gas emissions, alongside CO₂. With an adjusted R² of 95.15%, the model confirms that both variables significantly influence total GHG emissions.

## Further Work

This analysis can be extended by incorporating additional factors, such as energy consumption or government policies, to provide a more comprehensive understanding of GreenHouse Gas emissions. Additionally, more advanced modeling techniques like machine learning could improve predictive accuracy.

## Requirements

To run this analysis, the following software and packages are required:

Software
	•	R (version 4.0.0 or higher)

## R Packages

The following R packages must be installed:
	•	dplyr (for data manipulation)
	•	ggplot2 (for creating plots)
	•	cowplot (for combining multiple plots)
	•	GGally (for pairwise correlation plots)

To install the required packages, run the following command in R:

	install.packages(c("dplyr", "ggplot2", "cowplot", "GGally"))

## License

This project is licensed under the MIT License - see the LICENSE file for details.


## Extended Insights

Beyond numerical analysis, this study highlights the broader implications of economic policies on sustainability. Policymakers must balance economic growth with environmental considerations, emphasizing the importance of green energy initiatives.


## Acknowledgments

- This project was completed as part of a Master’s program project at the [University of Auckland](https://www.auckland.ac.nz/en.html). Special thanks to the University of Auckland for the opportunity to undertake this project and for their invaluable support.
