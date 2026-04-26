# 📊 Customer Retention & Cohort Analysis (E-Commerce)

## 📌 Project Overview

This project analyzes customer retention behavior in an e-commerce platform using cohort analysis.

The objective is to understand how customers behave after their first purchase and identify patterns in repeat purchases over time.

---

## 🎯 Business Problem

The company is acquiring new customers successfully, but customer retention is unclear.

Low retention can lead to:
- Reduced repeat purchases
- Lower customer lifetime value (CLTV)
- Increased dependency on new customer acquisition

---

## 🧠 Objective

- Track customer retention over time
- Identify drop-off patterns after first purchase
- Analyze cohort-wise behavior
- Provide actionable insights to improve retention and engagement

---

## 🗂️ Dataset

- Source: Brazilian E-Commerce Dataset (Olist)
- Key fields used:
  - customer_unique_id
  - order_id
  - order_purchase_timestamp

---

## ⚙️ Tools & Technologies

- Python (Pandas, NumPy)
- Matplotlib & Seaborn (Visualization)
- SQL (Cohort calculation & retention queries)
- Power BI (Interactive dashboard)
- Jupyter Notebook

---

## 🔍 Approach

### 1. Data Preparation
- Merged orders and customers dataset
- Selected relevant columns
- Converted timestamps to datetime

### 2. Cohort Creation
- Identified first purchase month (cohort)
- Created order month
- Calculated cohort index (months since first purchase)

### 3. Retention Analysis
- Built cohort table
- Calculated retention rates
- Analyzed customer behavior over time

### 4. Visualization
- Generated cohort heatmap (primary visualization)
- Created retention trend and cohort size charts
- Built Power BI dashboard

---

## 📈 Key Insights

- Customer retention drops sharply after the first purchase
- Less than 1% of users return in subsequent months
- Majority of customers are one-time buyers
- Retention is consistently low across all cohorts
- Business heavily relies on new customer acquisition

---

## 💡 Business Recommendations

- Implement loyalty programs and personalized offers to improve repeat purchases
- Improve post-purchase engagement (email campaigns, notifications)
- Enhance customer experience (delivery, product quality, support)
- Introduce incentives for repeat purchases or subscriptions
- Analyze higher-retention cohorts to replicate successful strategies

---

## 📊 Dashboard

The Power BI dashboard includes:
- Cohort heatmap (retention matrix)
- Cohort size analysis
- Retention trend over time
- KPI cards (Total Customers, Avg Retention)

---

## 📁 Project Structure
## 👤 Author

**Abhishek K**  
Aspiring Data Analyst | Python | SQL | Power BI

---
