---
layout: posts
title:  "Credit Card Analysis"
date:   2024-06-08 19:14:27 -0500
author_profile: true
author: Mya Finley
categories: portfolio
header:
description: This article is an indepth look at my credit card analysis featured on both my resume and portfolio.
---
Credit card usage is increasing around the world as cash usage decreases. This dataset provides a look at cities in India and their credit card usage. This credit card dataset came from this Kaggle [dataset](https://www.kaggle.com/datasets/vikramamin/credit-card-spend-analysis).


I approached analyzing this dataset by determining what questions I wanted to answer. My main questions were which cities have the highest spenders on average, which city has the lowest spenders on average, is there any correlation between expense type and card type, and which months consistently have the highest spending YOY and which card type spends the most.

My results were as follows:
1. The city with the highest spenders on average was Thodupuzha with the average amount spent per year being $296,684.
2. The city with the lowest spenders on average was Bahraich with the average amount spent per year being $12,127
3. The coorelation between expense type and card type is as follows:
	-Gold, Platinum, Signature, and Silver card holders all had bills as their highest expense. 
	-While platinum and silver card members spent around the same on food, platinum members spent less on fuel compared to silver card holders
4. January 2015 was the highest spending month overall with 223,558,574 being spent that month.


My next step would be to see if there is any other coorelation that I may have missed that would have proven helpful. For example, I did not look at gender when analyzing this dataset and their may be some correlation between gender and spending that I did not take into account.

[Tableau dashboard](https://public.tableau.com/views/CreditCardAnalysisPortfolio/YOYDashboard?:language=en-US&:sid=&:display_count=n&:origin=viz_share_link)


## Which cities have the highest spenders on average?
	SELECT DISTINCT city,avg(amount) as Avg_Amount
	FROM CreditCards
	GROUP BY city
	ORDER BY Avg_Amount DESC
	LIMIT 10;


## Which city has the lowest spenders on average? 
	SELECT DISTINCT city,avg(amount) as Avg_Amount
	FROM CreditCards
	GROUP BY city
	ORDER BY Avg_Amount ASC
	LIMIT 10;

## What is the correlation between expense type and card type?  
	SELECT exp_type,card_type,round(avg(amount)) as Avg_Amount
	FROM CreditCards
	GROUP BY card_type,exp_type;

## Which months have the highest spending YOY and which card type spends the most?  
	SELECT month,year,card_type,amount
	FROM CreditCards
	GROUP BY year,month,card_type
	ORDER BY Amount DESC;