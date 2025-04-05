## Hurricane Trend Over Decades

### Author: Saakshi Agarwal (saga747)

## Overview

This analysis explores hurricane trends using the built-in `storms` dataset in R, sourced from the NOAA Atlantic hurricane database (HURDAT). The dataset spans from 1975 to 2022 and focuses on how hurricane **frequency and intensity** have evolved over time. Key variables analyzed include:

- `year`: Year of occurrence
- `status`: Storm classification
- `wind`: Wind speed (in knots)

By analyzing trends across decades, this study aims to reveal how hurricanes are changing and what that means for disaster readiness and climate monitoring.

## Key Findings

1.	Hurricane frequency has increased significantly across decades.
	•	The 1970s recorded 289 hurricanes.
	•	This number rose steadily, peaking at 1166 hurricanes in the 2000s.
	•	The drop to 392 in the 2020s is attributed to partial decade data.

2.	Hurricane intensity shows a growing trend.
	•	The average wind speed increased from 83.25 knots (1970s) to 87.53 knots (2020s).
	•	The 2000s saw the highest average wind speed at 89.74 knots.

3.	Wind speed distribution shows greater variability and outliers.
	•	Median wind speed remained relatively stable (80–85 knots).
	•	Interquartile Range (IQR) increased in the 2000s (from 25 to 30 knots).
	•	Extreme wind speed outliers appeared more frequently in recent decades, indicating intensifying storms.

These insights suggest that hurricanes are not only becoming more frequent but also more intense and variable, emphasizing the importance of robust climate response strategies.

## Data Source

•	Dataset: storms (available in R)  
•	Source: NOAA Atlantic hurricane database (HURDAT)  
•	Time Period: 1975 – 2022  
•	Total Observations: 5,515 hurricanes  
•	Key Variables:  
	•	year: Year of occurrence  
	•	status: Storm classification (e.g., hurricane)  
	•	wind: Wind speed in knots  

## Summary Statistics by Decade (1970–2020)

| Decade  | Avg Wind Speed (Knots) | No. of Hurricanes | Median Wind Speed (Knots) | IQR (Knots) |
|---------|------------------------|-------------------|----------------------------|-------------|
| 1970s   | 83.25                  | 289               | 80                         | 25          |
| 1980s   | 83.29                  | 740               | 80                         | 25          |
| 1990s   | 83.93                  | 1132              | 80                         | 25          |
| 2000s   | 89.74                  | 1166              | 85                         | 30          |
| 2010s   | 87.42                  | 1084              | 80                         | 30          |
| 2020s   | 87.53                  | 392               | 80                         | 30          |

## Visualization Highlights

### Hurricane Wind Speed Distribution by Decade (1975–2022)

Figure 1.1 shows boxplots of wind speeds across decades.  
	•	Median wind speed remained steady at ~80–85 knots.  
	•	IQR increased in the 2000s, suggesting higher wind speed variability.  
	•	Recent decades show more outliers, indicating more intense hurricanes.

## Technical Implementation

1. Required Libraries

Ensure the following libraries are installed before executing the analysis:

	install.packages("tidyverse")   # Install if not already installed  
	library(ggplot2)                # For data visualization  
	library(dplyr)                  # For data manipulation  

2. Load and Explore the Data

		data(storms)                     # Load the dataset  
		storms_hurricane <- storms %>%  
		  filter(status == "hurricane") # Filter for hurricanes only  
		str(storms_hurricane)           # Structure of filtered data  

3. Create Decade Column

		storms_hurricane <- storms_hurricane %>%  
		  mutate(decade = floor(year / 10) * 10)  

4. Summary Statistics by Decade

		summary_stats <- storms_hurricane %>%  
		  group_by(decade) %>%  
		  summarise(  
		    avg_wind = mean(wind, na.rm = TRUE),  
		    count = n(),  
		    median_wind = median(wind, na.rm = TRUE),  
		    IQR = IQR(wind, na.rm = TRUE)  
		  )  
		print(summary_stats)  

5. Create Boxplot of Wind Speeds

		ggplot(storms_hurricane, aes(x = as.factor(decade), y = wind)) +  
		  geom_boxplot(fill = "skyblue", color = "darkblue") +  
		  labs(  
		    title = "Hurricane Wind Speed Distribution by Decade",  
		    x = "Decade",  
		    y = "Wind Speed (knots)"  
		  ) +  
		  theme_minimal()  

## Conclusion

This study finds both consistency and escalation in hurricane characteristics:  
	•	Frequency of hurricanes has increased over the decades.  
	•	Average and variability in wind speeds have grown, indicating intensifying storms.  
	•	Recent decades are marked by more extreme outliers, underscoring the importance of monitoring and preparedness.

Continued analysis into additional variables like pressure, sea surface temperatures, and ENSO cycles could further enrich understanding of hurricane behavior.

## License

This project is licensed under the MIT License.

## Acknowledgments

- This project was completed as part of a Master’s program project at the [University of Auckland](https://www.auckland.ac.nz/en.html).  
- Special thanks to the University of Auckland for academic support and resources.
