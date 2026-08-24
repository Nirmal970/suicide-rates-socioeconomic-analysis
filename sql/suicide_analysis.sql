-- ============================================================
-- Suicide Rates & Socioeconomic Factors Analysis
-- Analytical SQL Queries
-- ============================================================


-- 1. Regional Suicide Rate Comparison
-- Compare average age-standardized suicide rates across regions.

SELECT RegionName, AVG(DeathRatePer100K) AS AvgDeathRate, COUNT(DISTINCT CountryCode) AS Countries
FROM age_std_suicide_rates_pro
GROUP BY RegionName
ORDER BY AvgDeathRate DESC;


-- 2. Suicide Rate Comparison by Sex
-- Compare average suicide rates between male and female observations.

SELECT Sex, AVG(DeathRatePer100K) AS AvgDeathRate, COUNT(*) AS Observations
FROM age_std_suicide_rates_pro
GROUP BY Sex
ORDER BY AvgDeathRate DESC;


-- 3. Top 10 Countries by Average Suicide Rate
-- Identify countries with higher average rates with at least 5 years of data.

SELECT TOP 10 CountryCode, CountryName, RegionName, AVG(DeathRatePer100K) AS AvgDeathRate, COUNT(DISTINCT Year) AS YearsObserved
FROM age_std_suicide_rates_pro
GROUP BY CountryCode, CountryName, RegionName
HAVING COUNT(DISTINCT Year) >= 5
ORDER BY AvgDeathRate DESC;


-- 4. Year-over-Year Change
-- Calculate annual changes using LAG().

WITH CountryYear AS (
    SELECT CountryCode, CountryName, Year, AVG(DeathRatePer100K) AS AvgDeathRate
    FROM age_std_suicide_rates_pro
    GROUP BY CountryCode, CountryName, Year
)
SELECT CountryCode, CountryName, Year, AvgDeathRate,
       LAG(AvgDeathRate) OVER (PARTITION BY CountryCode ORDER BY Year) AS PreviousYearRate,
       AvgDeathRate - LAG(AvgDeathRate) OVER (PARTITION BY CountryCode ORDER BY Year) AS YoYChange
FROM CountryYear
ORDER BY CountryName, Year;


-- 5. Largest Year-over-Year Increases
-- Identify country-years with the largest increases.

WITH CountryYear AS (
    SELECT CountryCode, CountryName, Year, AVG(DeathRatePer100K) AS AvgDeathRate
    FROM age_std_suicide_rates_pro
    GROUP BY CountryCode, CountryName, Year
),
RateChanges AS (
    SELECT CountryCode, CountryName, Year, AvgDeathRate,
           LAG(AvgDeathRate) OVER (PARTITION BY CountryCode ORDER BY Year) AS PreviousYearRate
    FROM CountryYear
)
SELECT TOP 10 CountryName, Year, PreviousYearRate, AvgDeathRate,
       AvgDeathRate - PreviousYearRate AS YoYIncrease
FROM RateChanges
WHERE PreviousYearRate IS NOT NULL
ORDER BY YoYIncrease DESC;


-- 6. Country Ranking Within Each Region
-- Rank countries by average suicide rate within their region.

WITH CountryRates AS (
    SELECT CountryCode, CountryName, RegionName, AVG(DeathRatePer100K) AS AvgDeathRate
    FROM age_std_suicide_rates_pro
    GROUP BY CountryCode, CountryName, RegionName
)
SELECT CountryName, RegionName, AvgDeathRate,
       DENSE_RANK() OVER (PARTITION BY RegionName ORDER BY AvgDeathRate DESC) AS RegionalRank
FROM CountryRates
ORDER BY RegionName, RegionalRank;


-- 7. Regional Socioeconomic Comparison
-- Compare suicide rates with key socioeconomic indicators.

SELECT RegionName, AVG(DeathRatePer100K) AS AvgDeathRate,
       AVG(GDPPerCapita) AS AvgGDPPerCapita,
       AVG(GNIPerCapita) AS AvgGNIPerCapita,
       AVG(InflationRate) AS AvgInflationRate
FROM age_std_suicide_rates_pro
GROUP BY RegionName
ORDER BY AvgDeathRate DESC;


-- 8. Male-Female Rate Gap by Country
-- Identify countries with the largest male-to-female rate disparity.

WITH GenderRates AS (
    SELECT CountryCode, CountryName, Sex, AVG(DeathRatePer100K) AS AvgRate
    FROM age_std_suicide_rates_pro
    GROUP BY CountryCode, CountryName, Sex
),
GenderPivot AS (
    SELECT CountryCode, CountryName,
           MAX(CASE WHEN Sex = 'Male' THEN AvgRate END) AS MaleRate,
           MAX(CASE WHEN Sex = 'Female' THEN AvgRate END) AS FemaleRate
    FROM GenderRates
    GROUP BY CountryCode, CountryName
)
SELECT TOP 10 CountryName, MaleRate, FemaleRate,
       MaleRate - FemaleRate AS GenderGap,
       MaleRate / NULLIF(FemaleRate, 0) AS MaleFemaleRatio
FROM GenderPivot
WHERE MaleRate IS NOT NULL AND FemaleRate IS NOT NULL
ORDER BY MaleFemaleRatio DESC;