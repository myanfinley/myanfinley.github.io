---
layout: post
title:  "Healthcare Analysis"
date:   2024-05-31 17:43:30 +0000
categories: work
highlight_home: true
---

SQL code I used:
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

You’ll find this post in your `_posts` directory. Go ahead and edit it and re-build the site to see your changes. You can rebuild the site in many different ways, but the most common way is to run `jekyll serve`, which launches a web server and auto-regenerates your site when a file is updated.

Jekyll requires blog post files to be named according to the following format:

`YEAR-MONTH-DAY-title.MARKUP`

Where `YEAR` is a four-digit number, `MONTH` and `DAY` are both two-digit numbers, and `MARKUP` is the file extension representing the format used in the file. After that, include the necessary front matter. Take a look at the source for this post to get an idea about how it works.

Jekyll also offers powerful support for code snippets:

{% highlight ruby %}
def print_hi(name)
  puts "Hi, #{name}"
end
print_hi('Tom')
#=> prints 'Hi, Tom' to STDOUT.
{% endhighlight %}

Check out the [Jekyll docs][jekyll-docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s GitHub repo][jekyll-gh]. If you have questions, you can ask them on [Jekyll Talk][jekyll-talk].

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]:   https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
