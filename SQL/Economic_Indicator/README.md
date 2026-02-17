Global Economic Indicators Database (SQL Project)
📌 Project Overview

This project involves designing and implementing a fully structured macroeconomic database system using SQL.

The database models multi-dimensional economic indicators across 50 countries, covering GDP, inflation, unemployment, trade balance, interest rates, and agricultural performance.

Rather than analyzing a static dataset, this project builds:

A normalized relational schema

Indexed time-series tables

Simulated multi-year macroeconomic data

Cross-domain analytical queries

It demonstrates database design, economic modeling, and advanced analytical SQL techniques.



🏗 Database Architecture
Core Entity Table

countries

Country metadata

Region classification

Income group

Population

Currency

Capital

This table serves as the primary dimension for all economic indicators.

Time-Series Indicator Tables

gdp_data

Quarterly GDP (2012–2024)

Growth rates

GDP per capita

PPP values

inflation_rates

Monthly inflation data (2020–2024)

Core, food, and energy inflation

unemployment_data

Quarterly unemployment

Youth, male, female segmentation

Labor force participation

trade_balance

Exports, imports

Net trade balance

Trade-to-GDP ratio

interest_rates

Central bank rate

Lending & deposit rates

Real interest rate

agricultural_indicators

Cereal production

Crop & livestock indices

Agricultural GDP contribution

Food security index

Rural employment rate

Agricultural trade metrics



🧠 Data Modeling Strategy

Foreign key constraints enforce referential integrity

Composite indexes optimize time-series queries

Cross joins used to generate structured year-quarter-month grids

Conditional CASE logic used to simulate realistic economic variation

Randomized controlled growth modeling for macro trends

The dataset simulates realistic macroeconomic behavior across multiple income groups.



📈 Analytical SQL Techniques Used
✔ Multi-Table Joins

Connecting macroeconomic indicators across domains.

✔ Window Functions

4-quarter moving average for unemployment trend analysis.

✔ Aggregation & Grouping

Regional GDP growth comparison.
Trade surplus identification.

✔ Conditional Filtering

High-income country inflation analysis.
Positive trade balance screening.

✔ Time-Series Trend Analysis

Quarterly and monthly macro tracking.



🔍 Example Analytical Questions Answered

How does GDP growth vary by region post-2020?

Which high-income countries had the highest inflation in 2024?

Which countries maintained trade surpluses from 2022–2024?

What is the moving average unemployment trend for major economies?

How do policy interest rates correlate with inflation?

How does agricultural productivity relate to food security and rural employment?



🛠 Skills Demonstrated

Relational database design

Schema normalization

Index optimization

Time-series modeling

Economic systems thinking

Advanced SQL (JOIN, GROUP BY, HAVING, WINDOW FUNCTIONS)

Cross-domain data integration



🚀 Why This Project Matters

This project demonstrates the ability to:

Design databases, not just query them

Model macroeconomic systems structurally

Think in relationships and constraints

Build analytical pipelines directly in SQL

It reflects database engineering + economic data analytics capability.
