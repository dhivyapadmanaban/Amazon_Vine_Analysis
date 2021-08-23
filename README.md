# Amazon_Vine_Analysis

## Overview of the analysis 

This project analyzes Amazon Vine program and determines if there is a bias toward favorable reviews from Vine members.
The analysis uses PySpark to perform the ETL process to extract the dataset, transform the data, connect to an AWS RDS instance, load the transformed data into pgAdmin and calculate different metrics.

We focused on the US reviews for Lawn and garden products.

## Resources

- Data Source: [Amazon Review datasets](https://s3.amazonaws.com/amazon-reviews-pds/tsv/index.txt)
- Software: Google Colab Notebook, PostgreSQL 12.6, pgAdmin 4, AWS RDS

## Results 

Summarized results of paid vs unpaid amazon reviews on lawn and garden products are below: 


![image](https://user-images.githubusercontent.com/83181834/130373217-3f705005-a81d-4371-ad38-595e3a5aa6e6.png)


- Total number of Vine vs non-Vine reviews 
  
    Vine reviews are **386** vs non-Vine reviews are **48,717**. Clearly as per data, non vine reviews are 10 times more than vine reviews.
    
- Total number of 5 star vine vs non-vine reviews

    Total number of 5 star reviews for paid ones are **176** vs non paid ones are **24,026**. Almost half of the reviews are 5 star reviews on both paid and unpaid reviews. 
    
- Percentage of 5 star vine vs non-vine reviews

  Percentage of 5 star paid reviews is **45.6%** vs unpaid review is **49.32**. Both paid and unpaid percentage are closer in the range. 

## Summary 

To summarize, both paid and unpaid reviews have similar statistics on total number of 5 star reviews and its percentage. However, total number of reviews for unpaid vs paid has huge difference which change the weight-age of other supporting stats like 5 star review percentage. What these numbers seems to suggest is that there is **not strong bias toward** five-star reviews for Amazon vine reviewers. If anything, paid reviews might show a tendency towards being more critical in their reviews. 

### Evidence to support analysis

When "verified purchase" field is added to our analysis, we get enough evidence to suggest paid reviews didn't bias the products. Number of verified purchase of paid reviews is only "5" out of 387 reviews.

#### UNPAID REVIEW VERIFIED PURCHASES
![image](https://user-images.githubusercontent.com/83181834/130373151-28e3b6d6-6ab0-454a-9ed7-3d65e92b2e46.png)


Number of verified purchase of unpaid reviews is 32,711 which is 65% of the total reviews. 

#### PAID REVIEW VERIFIED PURCHASES
![image](https://user-images.githubusercontent.com/83181834/130373466-f8ef8e5c-3913-4088-a296-7fa8a9d3b36c.png)
