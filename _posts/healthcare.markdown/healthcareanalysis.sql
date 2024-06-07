Analysis of admission type based on age, gender, and medical condition
	SELECT
	    SUM(CASE WHEN admission_type = 'Elective' THEN 1 ELSE 0 END) as elective_count,
	    SUM(CASE WHEN admission_type = 'Emergency' THEN 1 ELSE 0 END) as emergency_count,
	    SUM(CASE WHEN admission_type = 'Urgent' THEN 1 ELSE 0 END) as urgent_count
	FROM healthcare_dataset;
	SELECT age,gender,medical_condition,admission_type
	FROM healthcare_dataset;
		
		
Analysis of insurance provider and billing amount 
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