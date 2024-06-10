---
layout: posts
title:  "Healthcare Analysis"
date:   2024-05-31 19:14:27 -0500
author_profile: true
author: Mya Finley
categories: portfolio
header:
description: This article is an indepth look at my healthcare analysis featured on both my resume and portfolio.
---
Healthcare cost have been on the rise in the United States for several decades now. I wanted to look at how much healthcare cost in the modern day and if there were any coorelation between admission type, insurance providers, and how much the hospital bill will be at the end of their stay. This healthcare dataset came from this Kaggle [dataset](https://www.kaggle.com/datasets/prasad22/healthcare-dataset).

I approached analyzing this dataset by asking the question if there were any difference between admission based on age group and health conditions, if certain insurance providers were much cheaper than others, and if medical condition and length of stay affects the total cost of hospital billing.

My results were as follows:
	1. The 36-64 age group had the highest amount of admissions, followed by 65 or older, and lastly the 18-35 age group.
	2. The insurance providers had around the same billing amount on average, however for minimum billing amount Aetna owned the patient money with their minimum amount being -2,008.
	3. Duration of stay did not seem to have an affect on the average billing amount, however cancer patients had the lowest average billing amount while obese patients had the highest average billing amount.

My next steps would be to compare this dataset to one an older one to see how much healthcare cost has increased in recent years.

[Tableau dashboard](https://public.tableau.com/views/HealthcareAnalysisPortfolio/AdmissionAnalysis?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)


SQL code I used:
## Analysis of admission type based on age, gender, and medical condition:
	SELECT
	  SUM(CASE WHEN admission_type = 'Elective' THEN 1 ELSE 0 END) as elective_count,
	  SUM(CASE WHEN admission_type = 'Emergency' THEN 1 ELSE 0 END) as emergency_count,
	  SUM(CASE WHEN admission_type = 'Urgent' THEN 1 ELSE 0 END) as urgent_count
	FROM healthcare_dataset;
	SELECT age,gender,medical_condition,admission_type
	FROM healthcare_dataset;
		
		
## Analysis of insurance provider and billing amount 
	SELECT insurance_provider,_billing_amount_
	FROM healthcare_dataset
	GROUP BY insurance_provider
	ORDER BY avg(_billing_amount_);
	
	SELECT insurance_provider,MIN(_billing_amount_)
	from healthcare_dataset
	GROUP BY insurance_provider
	order by _billing_amount_ ASC
	
	SELECT insurance_provider,MAX(_billing_amount_)
	from healthcare_dataset
	GROUP BY insurance_provider
	order by _billing_amount_ ASC
	
	
	SELECT medical_condition,insurance_provider,_billing_amount_
	FROM healthcare_dataset
	GROUP BY medical_condition,insurance_provider
  ORDER BY avg(_billing_amount_);
