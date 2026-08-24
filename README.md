# Suicide Rates & Socioeconomic Analysis

A data analytics project examining global suicide rates and their relationship with socioeconomic indicators across countries and regions. The project focuses on data preparation, exploratory analysis, analytical SQL, and dashboard-driven insights using Python, Pandas, SQL Server, Power BI, and Tableau.

## Architecture

```text
                    CSV Datasets
                         │
                         ▼
                  Python / Pandas
                 Data Preparation
                         │
                         ▼
                 Exploratory Analysis
                         │
              ┌──────────┴──────────┐
              │                     │
              ▼                     ▼
        Analytical SQL          Dashboarding
        SQL Server           Power BI / Tableau
              │                     │
              └──────────┬──────────┘
                         ▼
                  Business Insights
```

Pandas → data cleaning/EDA
SQL → analytical querying
Statistics → relationships/trends
Power BI + Tableau → data storytelling

Python was also used for exploratory predictive modeling and anomaly detection using **Scikit-learn and TensorFlow**.

SQL Analysis: Advanced SQL queries for trend analysis, regional comparisons, socioeconomic relationships, and analytical insights.

## Tech Stack

**Python • Pandas • SQL Server • Power BI • Tableau**

## Power BI Dashboard

![Power BI Dashboard](images/powerbi-dashboard.png)

## Tableau Dashboard

![Tableau Dashboard](images/tableau-dashboard.png)



## Project Components

- **Python / Pandas EDA:** `analysis/notebooks/pandas_eda.ipynb`
- **Python ETL:** `etl/python/pandas_etl.ipynb`
- **SQL Analysis:** `sql/suicide_analysis.sql`
- **Power BI Dashboard:** `dashboards/powerbi/`
- **Tableau Dashboard:** `dashboards/tableau/`

## Analytical Questions

The analysis focuses on questions such as:

- How do suicide rates vary across regions and countries?
- How significant is the difference between male and female suicide rates?
- Which countries show the highest average age-standardized rates?
- How do suicide rates vary across different years?
- What associations exist between suicide rates and socioeconomic indicators such as GDP, GNI, and inflation?
- Which observations require further investigation due to unusually high rates?

## Summary

The project applies Python and Pandas for data preparation and exploratory analysis, SQL for analytical querying and comparative analysis, and Power BI and Tableau for visualization and insight delivery.

The analysis examines regional and country-level differences, gender disparities, temporal patterns, socioeconomic associations, and potential outliers. Findings are interpreted as descriptive and exploratory relationships rather than causal effects.
