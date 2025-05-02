## Ecommerce Data Warehouse ETL Project

This project is an ETL (Extract, Transform, Load) pipeline designed to process ecommerce data and load it into a data warehouse for analysis. The project answers key business questions such as peak season analysis, user behavior, payment preferences, delivery performance, and more.

---

## Project Overview

This project processes ecommerce data from multiple sources, transforms it into a structured format, and loads it into a data warehouse. The data warehouse is designed to support analytical queries and provide insights into customer behavior, sales trends, and delivery performance.

### Key Questions Addressed
1. When is the peak season of our ecommerce ?
2. What time users are most likely make an order or using the ecommerce app?
3. What is the preferred way to pay in the ecommerce?
4. How many installment is usually done when paying in the ecommerce?
5. What is the average spending time for user for our ecommerce?
6. What is the frequency of purchase on each state?
7. Which logistic route that have heavy traffic in our ecommerce?
8. How many late delivered order in our ecommerce? Are late order affecting the customer satisfaction?
9. How long are the delay for delivery / shipping process in each state?
10. How long are the difference between estimated delivery time and actual delivery time in each state?

---

## Data Sources

![](images/source%20schema.jpg)

---

## ETL Process

### 1. Extract
- Data is extracted from CSV files: user_dataset.csv, seller_dataset.csv, products_dataset.csv, order_dataset.csv, order_item_dataset.csv, payment_dataset.csv, feedback_dataset.csv

### 2. Transform
#### Data Cleaning:

- Remove duplicates from user_df and seller_df.

- Convert data types (e.g., order_date to date).

#### Data Integration:

- Merge order_df with order_item_df, product_df, user_df, seller_df, and payment_df.

- Surrogate Key Assignment:

    - Assign surrogate keys to user_df, product_df, seller_df, and payment_df.

- Date and Time Handling:

    - Create date_dim and time_dim tables.

    - Extract date and time components (e.g., year, month, day, hour).

### 3. Load

- Tables are created in the ecommerce_dwh database.

- Load transformed data into the data warehouse using SQLAlchemy.

---

## Data Warehouse Schema

![](images/dimension%20model.jpg)

--- 
## Visualization

Payment Report
![1.0](https://github.com/user-attachments/assets/cf36395e-6ac0-4aae-a779-cb20337fef8d)
![1.1](https://github.com/user-attachments/assets/d7a437ac-5cf9-4c5a-88d9-27f0ad5be4ba)
![1.2](https://github.com/user-attachments/assets/26d447c3-6916-4d66-9500-fe467b109c13)

Feedback Report
![2.0](https://github.com/user-attachments/assets/e9a0f2d7-3e20-4572-ae15-6cf6dba43fb1)
![2.1](https://github.com/user-attachments/assets/db3e7e4b-b6b5-4e08-adb6-d8a5ec6150a2)
![2.2](https://github.com/user-attachments/assets/542a3df3-16cb-47e9-afe2-8dc3b815b020)
![2.3](https://github.com/user-attachments/assets/e21e1595-5f97-4789-a59e-87f4e079c918)
---

## Setup and Installation
##### Prerequisites
   - Python 3.x

   - pandas

   - SQLAlchemy

   - Microsoft SQL Server (or another supported database)

##### Steps
- Clone the repository:

```bash
git clone https://github.com/MaiElsayed01/E-Commerce-ETL.git
```

- Configure the database connection in config.py:

```python
server = "your-server-name"
database = "ecommerce_dwh"
driver = "your-driver"
```


