-- Understanding & Getting Overview of Data

Select * from dvd_rentals.film_list limit 10;

-- How many rows in the film_list table 

select 
  count(*) as RowCount
From dvd_rentals.film_list;

-- Show Unique Column Values 
--  What are the unique values for the rating & category column in film table
    
Select
    Distinct(rating)
From dvd_rentals.film_list;

Select
    Distinct(category) as Unique_category_count
From dvd_rentals.film_list;


-- Group By Counts

SELECT
  rating,
  COUNT(*) as record_count
FROM dvd_rentals.film_list
GROUP BY rating
ORDER BY record_count DESC;

-- Adding Percentage Column

select
  rating,
  count(*) As frequency,
  count(*) ::Numeric / sum(Count(*)) Over() as percentage
from  dvd_rentals.film_list
Group By rating
Order By frequency desc;

-- Using ROUND Function (Multiplying by 100)

Select
  Rating,
  Count(*) as frequency,
  Round(
        100 * Count(*) ::Numeric / sum(count(*)) Over(),2) 
        as Percentage
From dvd_rentals.film_list
Group By rating
Order By Frequency desc;

-- What are the 5 most frequent rating and category combinations in the film_list table?

Select
  rating,
  category,
  count(rating) as Frequency
From dvd_rentals.film_list
group by rating,category
order by frequency Desc
Limit 5;

-- Which actor_id has the most number of film_id records in the dvd_rentals.film_list table?

Select
  actor_id,
  Count(distinct(film_id)) as Count
from dvd_rentals.film_actor
group by actor_id
order by Count desc;


-- How many distinct fid values are there for the 3rd most common price value in the dvd_rentals.nicer_but_slower_film_list table?

Select
  price,
  Count(distinct(fid)) as Count
from dvd_rentals.nicer_but_slower_film_list
group by price
order by Count desc;

-- How many unique country_id values exist in the dvd_rentals.city table?

Select
  count(distinct country_id) as unique_countries
From dvd_rentals.city;

-- What percentage of overall total_sales does the Sports category make up in the dvd_rentals.sales_by_film_category table?

Select
  category,
  Round(
    100 * total_sales::Numeric / Sum(total_sales) Over(),2
  ) AS percentage
FROM dvd_rentals.sales_by_film_category;

-- What percentage of unique fid values are in the Children category in the dvd_rentals.film_list table?

Select
  category,
  Round(
    100* count(Distinct fid)::Numeric / SUM(Count(Distinct fid)) OVER (),2
    )AS percentage
From dvd_rentals.film_list
group by category
Order by Percentage desc;

  