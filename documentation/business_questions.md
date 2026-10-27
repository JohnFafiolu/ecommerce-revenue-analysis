# Business Questions

## Project
Brazilian E-Commerce Revenue and Customer Analysis

## Objective
Analyze delivered e-commerce orders to understand sales performance, product category contribution, customer repeat purchasing, and geographic revenue distribution.

## Questions and Business Value

### 1. Monthly Sales Performance
**Question:** How does merchandise sales change month by month?

**Business value:** Identify high-performing and low-performing periods to support sales planning.

### 2. Product Category Performance
**Question:** Which product categories generate the most merchandise sales?

**Business value:** Identify categories that contribute most to revenue and deserve further commercial investigation.

### 3. Repeat Purchase Rate
**Question:** What percentage of unique customers make more than one delivered purchase?

**Business value:** Establish a baseline for customer retention.

### 4. Customer Cohort Analysis
**Question:** How does repeat purchasing vary by the month customers first purchased?

**Business value:** Compare customer groups while accounting for when they entered the dataset. Recent cohorts have less time to make repeat purchases.

### 5. Customer Segmentation
**Question:** How do one-time customers and repeat customers compare in order volume and merchandise spending?

**Business value:** Understand the contribution of repeat customers to observed sales.

### 6. Geographic Sales Performance
**Question:** Which Brazilian states generate the most merchandise sales?

**Business value:** Identify major geographic markets for further investigation.

### 7. Category-Level Repeat Purchasing
**Question:** Which product categories have the highest percentage of customers buying from that category across multiple delivered orders?

**Business value:** Identify categories worth investigating for repeat-purchase opportunities, while considering sample sizes.

## Scope and Definitions

- **Delivered order:** An order whose recorded status is `delivered`.
- **Merchandise sales:** The sum of item prices, excluding freight and other charges.
- **Unique customer:** Identified using `customer_unique_id`.
- **Repeat customer:** A unique customer with more than one distinct delivered order during the observed dataset period.
- **Category repeat customer:** A customer with more than one distinct delivered order containing a particular category.

## Limitations

The dataset covers a finite period. Customers classified as one-time purchasers may return after the observation period. Cohorts have unequal follow-up time, and repeat-purchase rates based on small customer counts may be unstable. Merchandise sales are not the same as profit.
