--Creating new table 
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

--Selecting from table 
SELECT * FROM vine_table;


--Filter vine_Table where total_votes >= 20 
SELECT 
	review_id,
	star_rating,
	helpful_votes,
	total_votes,
	vine,
	verified_purchase 
INTO vine_table_filtered
FROM vine_table
WHERE total_votes >= 20;

--Query filtered table
SELECT * FROM vine_table_filtered;


--Filter vine_table_filtered where helpful_votes / total_votes >= 50% 
SELECT 
	review_id,
	star_rating,
	helpful_votes,
	total_votes,
	vine,
	verified_purchase 
INTO vine_table_votes_filtered
FROM vine_table_filtered
WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;

--Query the result
SELECT * FROM vine_table_votes_filtered;


--Filter vine_table_votes_filtered table to get records which are part of vine program
SELECT 
	review_id,
	star_rating,
	helpful_votes,
	total_votes,
	vine,
	verified_purchase 
INTO vine_program_reviews
FROM vine_table_votes_filtered
WHERE vine = 'Y';

--Query the result
SELECT * FROM vine_program_reviews;


--Filter vine_table_votes_filtered table to get records which are part of vine program
SELECT 
	review_id,
	star_rating,
	helpful_votes,
	total_votes,
	vine,
	verified_purchase 
INTO non_vine_program_reviews
FROM vine_table_votes_filtered
WHERE vine = 'N';

--Query the result
SELECT * FROM non_vine_program_reviews;


-- ********** VINE vs NON VINE analysis *************

-- Determine the total number of reviews, the number of 5-star reviews, and the percentage of 5-star reviews - PAID

SELECT 
	'PAID_REVIEWS' as review_type,
	V.TOTAL_REVIEWS,
	V.FIVE_STAR_REVIEWS,
	V.REVIEW_PERCENTAGE
INTO PAID_REVIEWS
FROM
(
SELECT 
	CAST(COUNT(review_id) as INTEGER) as TOTAL_REVIEWS, 
	CAST(COUNT(review_id) FILTER (WHERE star_rating=5) AS INTEGER) AS FIVE_STAR_REVIEWS,
    round ( (CAST(COUNT(review_id) FILTER (WHERE star_rating=5) AS FLOAT ) / CAST(COUNT(review_id) AS FLOAT) * 100)::numeric , 2) as REVIEW_PERCENTAGE
FROM vine_program_reviews
) V;

SELECT * FROM PAID_REVIEWS;

-- Determine the total number of reviews, the number of 5-star reviews, and the percentage of 5-star reviews - UNPAID

SELECT 
	'UNPAID_REVIEWS' as review_type,
	NV.TOTAL_REVIEWS,
	NV.FIVE_STAR_REVIEWS,
	NV.REVIEW_PERCENTAGE
INTO UNPAID_REVIEWS
FROM
(
SELECT 
	CAST(COUNT(review_id) as INTEGER) as TOTAL_REVIEWS, 
	CAST(COUNT(review_id) FILTER (WHERE star_rating=5) AS INTEGER) AS FIVE_STAR_REVIEWS,
    round ( (CAST(COUNT(review_id) FILTER (WHERE star_rating=5) AS FLOAT ) / CAST(COUNT(review_id) AS FLOAT) * 100)::numeric , 2) as REVIEW_PERCENTAGE
FROM non_vine_program_reviews
) NV;

SELECT * FROM UNPAID_REVIEWS;

--FINAL RESULTS


SELECT * FROM PAID_REVIEWS
UNION
SELECT * FROM UNPAID_REVIEWS;



