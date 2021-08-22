# Amazon_Vine_Analysis

## Overview of the analysis 

This project analyzes Amazon Vine program and determines if there is a bias toward favorable reviews from Vine members.
The analysis uses PySpark to perform the ETL process to extract the dataset, transform the data, connect to an AWS RDS instance, load the transformed data into pgAdmin and calculate different metrics.

We focused on the US reviews for Lawn and graden products.

## Resources

- Data Source: [Amazon Review datasets](https://s3.amazonaws.com/amazon-reviews-pds/tsv/index.txt)
- Software: Google Colab Notebook, PostgreSQL 12.6, pgAdmin 4, AWS RDS

## Results 

Summarized results of paid vs unpaid amazon reviews on lawn and garden products are below: 

![image](https://user-images.githubusercontent.com/83181834/130373217-3f705005-a81d-4371-ad38-595e3a5aa6e6.png)


## Summary 

### Evidence to support analysis

#### UNPAID REVIEW VERIFIED PURCHASES
![image](https://user-images.githubusercontent.com/83181834/130373151-28e3b6d6-6ab0-454a-9ed7-3d65e92b2e46.png)


#### PAID REVIEW VERIFIED PURCHASES
![image](https://user-images.githubusercontent.com/83181834/130373466-f8ef8e5c-3913-4088-a296-7fa8a9d3b36c.png)
