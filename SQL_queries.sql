.. 1. Retrieve the 20 richest billionaires. 
Select *
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
limit 20;

.. 2. Identify the five youngest billionaires. 
Select name,
		age
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
order by 2 ASC
limit 5;

.. 3. Calculate the average age and average net worth. 
select AVG (age),
		AVG (networth_billion) 
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld;

.. 4. Identify the five most represented countries. 
select country,
		COUNT (*) as five_most_represented_country
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
GROUP by 1
order by 2 desc
limit 5;

.. 5. Calculate the combined net worth of billionaires from each country. 
select country,
	SUM (networth_billion) AS combined_networth_billionaires
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
group by 1
order by 2 DESC;

.. 6. Identify the five industries with the highest number of billionaires. 
SELECT industry,
		count (*) AS highest_number_of_billionaires
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
GROUP by 1
order by 2 desc
limit 5;       

.. 7. Find countries with at least five billionaires. 
SELECT country,
		count (*) AS five_least_billionaires
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
GROUP by 1
HAVING COUNT(*) >= 5
order by 2 DESC;

.. 8. Calculate the total wealth of billionaires younger than 50. 
select SUM (networth_billion)
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
where age < 50;

.. 9. Identify billionaires whose net worth exceeds the overall average net worth. 
select name,
		networth_billion
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
where networth_billion > (
  select AVG(networth_billion)
  from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
  )
  
ORDER by networth_billion DESC;

.. 10.Identify the industry with the highest average net worth
select industry,
		AVG (networth_billion) as highest_average_netwroth
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
group by 1
order by 2 desc
limit 1;

.. 11. Which industry has the wealthiest billionaire?
select industry,
       MAX(networth_billion) as wealthiest_billionaire
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
group by 1
order by 2 desc
limit 1;

.. 12. Which country has the highest combined billionaire wealth? 
select country,
       SUM(networth_billion) as combined_billionaire_wealth
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
group by 1
order by 2 desc
Limit 1;

.. 13. Which country has the highest average billionaire net worth? 
select country,
       AVG(networth_billion) as highest_average_billionaire_networth
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
group by 1
order by 2 desc
limit 1; 

.. 14. Which industries have at least 10 billionaires? 
select industry,
		count(*) as numbers_of_biilionaires
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
group by industry
having count (*) >= 10
order by 2 desc;

.. 15. How many billionaires have a net worth above $50 billion? 
select count(*)
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
where networth_billion > 50;

.. 16. What percentage of the dataset is made up of billionaires younger than 50? 
SELECT
    ROUND(
        COUNT(CASE WHEN age < 50 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS percentage_of_billionaires
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld;

.. 17. Who has a net worth between $50 billion and $100 billion? 
select networth_billion,
	   name
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
where networth_billion BETWEEN 50 and 100
order by 1 desc;

.. 18. What is the total wealth of billionaires aged below 50? 
select SUM(networth_billion) as billionaire_age_below_50
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
WHERE age < 50

.. 19. Which country has the highest number of billionaires below age 40? 
SELECT country,
       COUNT(*) AS number_of_billionaires_below_40
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
WHERE age < 40
GROUP BY country
ORDER BY 2 DESC
LIMIT 1;

.. 20. Which industry contributes the most to the combined wealth of the top 200? 
select industry,
       SUM(networth_billion) as combined_wealth_of_top_200
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
group by 1
order by 2 desc
limit 1;

.. 21. What is the difference between the richest and poorest billionaire in the dataset? 
SELECT MAX(networth_billion) - MIN(networth_billion)
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld;

.. 22. What is the average net worth of billionaires aged above 70? 
select AVG(networth_billion) as billionaire_above_70
from Top200RichestPersonintheWorldTop200RichestPersonintheWorld
where age > 70;

.. 23. Which billionaires belong to industries with more than 10 representatives?
SELECT name,
       industry,
       networth_billion
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
WHERE industry IN (
    SELECT industry
    FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
    GROUP BY industry
    HAVING COUNT(*) > 10
)
ORDER BY industry;


		
