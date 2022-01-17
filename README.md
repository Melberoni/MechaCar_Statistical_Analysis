# MechaCar Statistical Analysis

## Linear Regression to Predict MPG
The image below shows the summary statistics for a linear regression performend on the mecha_car_mpg.csv data.
![deliverable1](https://github.com/Melberoni/MechaCar_Statistical_Analysis/blob/6de8168bbe942de5fd888c86adf92a175376eae2/Challenge/Linear_regression_mpg_deliverable1_annotated.png)
* the variables intercept, vehicle_length, ground_clearance and vehicle_weight provided a non-random amount of variance to the mpg values in the dataset. I underlined the stars indicating the signifiance in red alongside the Pvalues of these variables.
* The slope of the model is not considered to be zero because the pvalue is significant. The null hypothesis is The slope of the linear model is zero, or m = 0 since we have a significant pvalue of 5.35e-11 therefore we can state that there is sufficient evidence to reject our null hypothesis.
* I would say this linear model predicts mpg of MechaCar prototypes fairly well. The R-Squared value is .7149 which is a strong correlation , there are also a majority of the coefficients that are significant.


## Summary Statistics on Suspension
![total_summary](https://github.com/Melberoni/MechaCar_Statistical_Analysis/blob/eca29dc625fbaae9698bea8babbd634726800abb/Challenge/Total_summary_coils_dataset.png)

* In total the variance does not exceed 100 (summary above) and would meet manufacturing design specification. 
* However when we look at the variance by lot we can see that lot 3 has a variance at 170 (summary below), that would not meet manufacturing design specifications.

![lot_summary](https://github.com/Melberoni/MechaCar_Statistical_Analysis/blob/eca29dc625fbaae9698bea8babbd634726800abb/Challenge/Lot_summary_coils_dataset.png)
