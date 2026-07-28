-- ============================================================
-- Suicide Rates & Socioeconomic Factors Analysis
-- SQL Server Analysis Queries
-- ============================================================

USE suicide_analysis;
GO


-- Preview processed datasets

SELECT *
FROM age_std_suicide_rates_pro;

SELECT *
FROM suicide_rates_pro;


-- 1. Average suicide count by region

SELECT
    RegionName,
    AVG(SuicideCount) AS AverageSuicideCount
FROM age_std_suicide_rates_pro
GROUP BY RegionName
ORDER BY AverageSuicideCount DESC;


-- 2. Total suicide count by gender in the United States

SELECT
    CountryName,
    Sex,
    SUM(SuicideCount) AS TotalSuicideCount
FROM age_std_suicide_rates_pro
WHERE CountryCode = 'USA'
GROUP BY CountryName, CountryCode, Sex;


-- 3. Highest total inflation rate by country in 2001

SELECT TOP 1
    CountryName,
    SUM(InflationRate) AS TotalInflationRate
FROM age_std_suicide_rates_pro
WHERE Year = 2001
GROUP BY CountryName
ORDER BY TotalInflationRate DESC;


-- 4. Age group with the highest suicide count in Europe

SELECT TOP 1
    AgeGroup,
    SUM(SuicideCount) AS TotalSuicideCount
FROM suicide_rates_pro
WHERE RegionName = 'Europe'
GROUP BY AgeGroup
ORDER BY TotalSuicideCount DESC;


-- 5. Country with the lowest GDP per capita value in 2011

SELECT TOP 1
    CountryName,
    SUM(GDPPerCapita) AS GDPPerCapita
FROM suicide_rates_pro
WHERE Year = 2011
GROUP BY CountryName
ORDER BY GDPPerCapita ASC;