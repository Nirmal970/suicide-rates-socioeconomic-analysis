# Suicide Rates & Socioeconomic Analysis

A data analytics project exploring global suicide rates and socioeconomic indicators to identify trends, regional disparities, and relationships between socioeconomic factors and suicide rates. The project focuses on data-driven analysis and visualization to support evidence-based insights and decision-making.

## Architecture

```text
                  CSV Datasets
                       │
             ┌─────────┴─────────┐
             │                   │
      Python / Pandas           SSIS
        Data Processing       Data Processing
             │                   │
             └─────────┬─────────┘
                       │
                  SQL Server
                       │
              Analytical Queries
                       │
          ┌────────────┴────────────┐
          │                         │
       Power BI                  Tableau
       Dashboard                 Dashboard
          │                         │
          └────────────┬────────────┘
                       │
              Business Insights
```

Pandas → data cleaning/EDA
SQL → analytical querying
Statistics → relationships/trends
Power BI + Tableau → data storytelling

Python was also used for exploratory predictive modeling and anomaly detection using **Scikit-learn and TensorFlow**.

SQL Analysis: Advanced SQL queries for trend analysis, regional comparisons, socioeconomic relationships, and analytical insights.

## Tech Stack

**Python • Pandas • SSIS • SQL Server • Scikit-learn • TensorFlow • Power BI • Tableau**

## Power BI Dashboard

![Power BI Dashboard](images/powerbi-dashboard.png)

## Tableau Dashboard

![Tableau Dashboard](images/tableau-dashboard.png)



## Project Components

- **Pandas ETL:** `etl/python/pandas_etl.ipynb`
- **SSIS ETL:** `etl/ssis/`
- **SQL Analysis:** `sql/suicide_analysis.sql`
- **Predictive & Anomaly Analysis:** `analysis/notebooks/predictive_analysis.ipynb`
- **Power BI:** `dashboards/powerbi/`
- **Tableau:** `dashboards/tableau/`

## Summary

This project demonstrates the end-to-end analytical workflow of cleaning and preparing data with Pandas, querying and analyzing data using SQL Server, exploring socioeconomic relationships through statistical analysis, and communicating findings through Power BI and Tableau dashboards. The analysis focuses on identifying meaningful trends, regional differences, and socioeconomic patterns that can support evidence-based decision-making.
