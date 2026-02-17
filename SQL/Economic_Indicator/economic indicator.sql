-- ECONOMIC INDICATORS DATABASE 

-- Create and use database
DROP DATABASE IF EXISTS economic_indicators;
CREATE DATABASE economic_indicators;
USE economic_indicators;

-- TABLE 1: Countries
CREATE TABLE countries (
    country_id INT PRIMARY KEY AUTO_INCREMENT,
    country_code CHAR(3) UNIQUE NOT NULL,
    country_name VARCHAR(100) NOT NULL,
    region VARCHAR(50),
    income_group VARCHAR(50),
    population BIGINT,
    capital VARCHAR(100),
    currency_code CHAR(3),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABLE 2: GDP Data
CREATE TABLE gdp_data (
    gdp_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    year INT NOT NULL,
    quarter INT,
    gdp_current_usd DECIMAL(18,2),
    gdp_growth_rate DECIMAL(5,2),
    gdp_per_capita DECIMAL(12,2),
    gdp_ppp DECIMAL(18,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    INDEX idx_country_year (country_id, year),
    INDEX idx_year (year)
);

-- TABLE 3: Inflation Rates
CREATE TABLE inflation_rates (
    inflation_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    year INT NOT NULL,
    month INT,
    inflation_rate DECIMAL(6,3),
    core_inflation_rate DECIMAL(6,3),
    food_inflation DECIMAL(6,3),
    energy_inflation DECIMAL(6,3),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    INDEX idx_country_date (country_id, year, month)
);

-- TABLE 4: Unemployment Data
CREATE TABLE unemployment_data (
    unemployment_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    year INT NOT NULL,
    quarter INT,
    unemployment_rate DECIMAL(5,2),
    youth_unemployment DECIMAL(5,2),
    male_unemployment DECIMAL(5,2),
    female_unemployment DECIMAL(5,2),
    labor_force_participation DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    INDEX idx_country_year (country_id, year)
);

-- TABLE 5: Trade Balance
CREATE TABLE trade_balance (
    trade_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    year INT NOT NULL,
    quarter INT,
    exports_usd DECIMAL(15,2),
    imports_usd DECIMAL(15,2),
    trade_balance_usd DECIMAL(15,2),
    trade_gdp_ratio DECIMAL(6,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    INDEX idx_country_year (country_id, year)
);

-- TABLE 6: Interest Rates
CREATE TABLE interest_rates (
    rate_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    year INT NOT NULL,
    month INT,
    central_bank_rate DECIMAL(6,3),
    lending_rate DECIMAL(6,3),
    deposit_rate DECIMAL(6,3),
    real_interest_rate DECIMAL(6,3),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    INDEX idx_country_date (country_id, year, month)
);

-- TABLE 7: Agricultural Indicators (MISSING - NOW ADDED)
CREATE TABLE agricultural_indicators (
    agri_id INT PRIMARY KEY AUTO_INCREMENT,
    country_id INT,
    year INT NOT NULL,
    quarter INT,
    cereal_production_mt DECIMAL(15,2),
    crop_production_index DECIMAL(8,2),
    livestock_production_index DECIMAL(8,2),
    food_price_index DECIMAL(8,2),
    agricultural_value_added_usd DECIMAL(15,2),
    agri_gdp_percentage DECIMAL(5,2),
    arable_land_hectares DECIMAL(18,2),
    fertilizer_consumption_kg DECIMAL(10,2),
    agricultural_exports_usd DECIMAL(15,2),
    agricultural_imports_usd DECIMAL(15,2),
    food_security_index DECIMAL(5,2),
    rural_employment_rate DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (country_id) REFERENCES countries(country_id),
    INDEX idx_country_year (country_id, year)
);

-- INSERTING DATA - Countries (50 countries)
INSERT INTO countries (country_code, country_name, region, income_group, population, capital, currency_code) VALUES
('USA', 'United States', 'North America', 'High Income', 331900000, 'Washington D.C.', 'USD'),
('CHN', 'China', 'East Asia', 'Upper Middle Income', 1439323776, 'Beijing', 'CNY'),
('JPN', 'Japan', 'East Asia', 'High Income', 126476461, 'Tokyo', 'JPY'),
('DEU', 'Germany', 'Europe', 'High Income', 83783942, 'Berlin', 'EUR'),
('GBR', 'United Kingdom', 'Europe', 'High Income', 67886011, 'London', 'GBP'),
('IND', 'India', 'South Asia', 'Lower Middle Income', 1380004385, 'New Delhi', 'INR'),
('FRA', 'France', 'Europe', 'High Income', 65273511, 'Paris', 'EUR'),
('ITA', 'Italy', 'Europe', 'High Income', 60461826, 'Rome', 'EUR'),
('BRA', 'Brazil', 'South America', 'Upper Middle Income', 212559417, 'Brasilia', 'BRL'),
('CAN', 'Canada', 'North America', 'High Income', 37742154, 'Ottawa', 'CAD'),
('RUS', 'Russia', 'Europe/Asia', 'Upper Middle Income', 145934462, 'Moscow', 'RUB'),
('KOR', 'South Korea', 'East Asia', 'High Income', 51269185, 'Seoul', 'KRW'),
('AUS', 'Australia', 'Oceania', 'High Income', 25499884, 'Canberra', 'AUD'),
('ESP', 'Spain', 'Europe', 'High Income', 46754778, 'Madrid', 'EUR'),
('MEX', 'Mexico', 'North America', 'Upper Middle Income', 128932753, 'Mexico City', 'MXN'),
('IDN', 'Indonesia', 'Southeast Asia', 'Lower Middle Income', 273523615, 'Jakarta', 'IDR'),
('NLD', 'Netherlands', 'Europe', 'High Income', 17134872, 'Amsterdam', 'EUR'),
('SAU', 'Saudi Arabia', 'Middle East', 'High Income', 34813871, 'Riyadh', 'SAR'),
('TUR', 'Turkey', 'Europe/Asia', 'Upper Middle Income', 84339067, 'Ankara', 'TRY'),
('CHE', 'Switzerland', 'Europe', 'High Income', 8654622, 'Bern', 'CHF'),
('POL', 'Poland', 'Europe', 'High Income', 37846611, 'Warsaw', 'PLN'),
('BEL', 'Belgium', 'Europe', 'High Income', 11589623, 'Brussels', 'EUR'),
('SWE', 'Sweden', 'Europe', 'High Income', 10099265, 'Stockholm', 'SEK'),
('NGA', 'Nigeria', 'Africa', 'Lower Middle Income', 206139589, 'Abuja', 'NGN'),
('ARG', 'Argentina', 'South America', 'Upper Middle Income', 45195774, 'Buenos Aires', 'ARS'),
('NOR', 'Norway', 'Europe', 'High Income', 5421241, 'Oslo', 'NOK'),
('AUT', 'Austria', 'Europe', 'High Income', 9006398, 'Vienna', 'EUR'),
('ARE', 'United Arab Emirates', 'Middle East', 'High Income', 9890402, 'Abu Dhabi', 'AED'),
('ISR', 'Israel', 'Middle East', 'High Income', 8655535, 'Jerusalem', 'ILS'),
('DNK', 'Denmark', 'Europe', 'High Income', 5792202, 'Copenhagen', 'DKK'),
('SGP', 'Singapore', 'Southeast Asia', 'High Income', 5850342, 'Singapore', 'SGD'),
('MYS', 'Malaysia', 'Southeast Asia', 'Upper Middle Income', 32365999, 'Kuala Lumpur', 'MYR'),
('PHL', 'Philippines', 'Southeast Asia', 'Lower Middle Income', 109581078, 'Manila', 'PHP'),
('ZAF', 'South Africa', 'Africa', 'Upper Middle Income', 59308690, 'Pretoria', 'ZAR'),
('EGY', 'Egypt', 'Africa', 'Lower Middle Income', 102334404, 'Cairo', 'EGP'),
('VNM', 'Vietnam', 'Southeast Asia', 'Lower Middle Income', 97338579, 'Hanoi', 'VND'),
('PAK', 'Pakistan', 'South Asia', 'Lower Middle Income', 220892340, 'Islamabad', 'PKR'),
('BGD', 'Bangladesh', 'South Asia', 'Lower Middle Income', 164689383, 'Dhaka', 'BDT'),
('IRN', 'Iran', 'Middle East', 'Lower Middle Income', 83992949, 'Tehran', 'IRR'),
('THA', 'Thailand', 'Southeast Asia', 'Upper Middle Income', 69799978, 'Bangkok', 'THB'),
('FIN', 'Finland', 'Europe', 'High Income', 5540720, 'Helsinki', 'EUR'),
('CHL', 'Chile', 'South America', 'High Income', 19116201, 'Santiago', 'CLP'),
('IRL', 'Ireland', 'Europe', 'High Income', 4937786, 'Dublin', 'EUR'),
('PRT', 'Portugal', 'Europe', 'High Income', 10196709, 'Lisbon', 'EUR'),
('GRC', 'Greece', 'Europe', 'High Income', 10423054, 'Athens', 'EUR'),
('NZL', 'New Zealand', 'Oceania', 'High Income', 4822233, 'Wellington', 'NZD'),
('CZE', 'Czech Republic', 'Europe', 'High Income', 10708981, 'Prague', 'CZK'),
('ROU', 'Romania', 'Europe', 'High Income', 19237691, 'Bucharest', 'RON'),
('HUN', 'Hungary', 'Europe', 'High Income', 9660351, 'Budapest', 'HUF'),
('KEN', 'Kenya', 'Africa', 'Lower Middle Income', 53771296, 'Nairobi', 'KES');

-- INSERTING GDP DATA (2012-2024, Quarterly data for major economies)
INSERT INTO gdp_data (country_id, year, quarter, gdp_current_usd, gdp_growth_rate, gdp_per_capita, gdp_ppp)
SELECT 
    c.country_id,
    y.year,
    q.quarter,
    CASE
        WHEN c.country_code = 'USA' THEN 5000000 + (y.year - 2012) * 500000 + q.quarter * 100000 + RAND() * 200000
        WHEN c.country_code = 'CHN' THEN 3500000 + (y.year - 2012) * 450000 + q.quarter * 90000 + RAND() * 150000
        WHEN c.country_code = 'JPN' THEN 1200000 + (y.year - 2012) * 50000 + q.quarter * 10000 + RAND() * 30000
        WHEN c.country_code = 'DEU' THEN 1000000 + (y.year - 2012) * 40000 + q.quarter * 8000 + RAND() * 25000
        WHEN c.country_code = 'IND' THEN 800000 + (y.year - 2012) * 100000 + q.quarter * 20000 + RAND() * 40000
        ELSE 500000 + (y.year - 2012) * 30000 + q.quarter * 5000 + RAND() * 20000
    END,
    ROUND(1.5 + RAND() * 4.5, 2),
    ROUND(30000 + (y.year - 2012) * 1500 + RAND() * 5000, 2),
    ROUND(6000000 + (y.year - 2012) * 300000 + RAND() * 100000, 2)
FROM 
    countries c
    CROSS JOIN (SELECT 2012 AS year UNION SELECT 2013 UNION SELECT 2014 UNION SELECT 2015 
                UNION SELECT 2016 UNION SELECT 2017 UNION SELECT 2018 UNION SELECT 2019 
                UNION SELECT 2020 UNION SELECT 2021 UNION SELECT 2022 UNION SELECT 2023 UNION SELECT 2024) y
    CROSS JOIN (SELECT 1 AS quarter UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) q
WHERE c.country_id <= 15;

-- INSERTING INFLATION DATA (Monthly data for all countries, years 2020-2024)
INSERT INTO inflation_rates (country_id, year, month, inflation_rate, core_inflation_rate, food_inflation, energy_inflation)
SELECT 
    c.country_id,
    y.year,
    m.month,
    ROUND(2.0 + RAND() * 6.0, 3),
    ROUND(1.5 + RAND() * 4.0, 3),
    ROUND(2.5 + RAND() * 8.0, 3),
    ROUND(3.0 + RAND() * 10.0, 3)
FROM 
    countries c
    CROSS JOIN (SELECT 2020 AS year UNION SELECT 2021 UNION SELECT 2022 UNION SELECT 2023 UNION SELECT 2024) y
    CROSS JOIN (SELECT 1 AS month UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 
                UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 
                UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12) m
WHERE c.country_id <= 20;

-- INSERTING UNEMPLOYMENT DATA (Quarterly data for years 2012-2024)
INSERT INTO unemployment_data (country_id, year, quarter, unemployment_rate, youth_unemployment, male_unemployment, female_unemployment, labor_force_participation)
SELECT 
    c.country_id,
    y.year,
    q.quarter,
    ROUND(3.5 + RAND() * 8.0, 2),
    ROUND(8.0 + RAND() * 15.0, 2),
    ROUND(3.0 + RAND() * 7.0, 2),
    ROUND(4.0 + RAND() * 9.0, 2),
    ROUND(55.0 + RAND() * 20.0, 2)
FROM 
    countries c
    CROSS JOIN (SELECT 2012 AS year UNION SELECT 2013 UNION SELECT 2014 UNION SELECT 2015 
                UNION SELECT 2016 UNION SELECT 2017 UNION SELECT 2018 UNION SELECT 2019 
                UNION SELECT 2020 UNION SELECT 2021 UNION SELECT 2022 UNION SELECT 2023 UNION SELECT 2024) y
    CROSS JOIN (SELECT 1 AS quarter UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) q
WHERE c.country_id <= 12;

-- INSERTING TRADE BALANCE DATA (Quarterly data for years 2014-2024)
INSERT INTO trade_balance (country_id, year, quarter, exports_usd, imports_usd, trade_balance_usd, trade_gdp_ratio)
SELECT 
    c.country_id,
    y.year,
    q.quarter,
    ROUND(100000 + (y.year - 2014) * 10000 + RAND() * 50000, 2),
    ROUND(95000 + (y.year - 2014) * 9500 + RAND() * 45000, 2),
    ROUND((100000 + (y.year - 2014) * 10000 + RAND() * 50000) - (95000 + (y.year - 2014) * 9500 + RAND() * 45000), 2),
    ROUND(5.0 + RAND() * 15.0, 2)
FROM 
    countries c
    CROSS JOIN (SELECT 2014 AS year UNION SELECT 2015 UNION SELECT 2016 UNION SELECT 2017 
                UNION SELECT 2018 UNION SELECT 2019 UNION SELECT 2020 UNION SELECT 2021 
                UNION SELECT 2022 UNION SELECT 2023 UNION SELECT 2024) y
    CROSS JOIN (SELECT 1 AS quarter UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) q
WHERE c.country_id <= 13;

-- INSERTING INTEREST RATES DATA (Monthly data for years 2020-2024)
INSERT INTO interest_rates (country_id, year, month, central_bank_rate, lending_rate, deposit_rate, real_interest_rate)
SELECT 
    c.country_id,
    y.year,
    m.month,
    ROUND(0.5 + RAND() * 5.0, 3),
    ROUND(2.5 + RAND() * 7.0, 3),
    ROUND(0.25 + RAND() * 3.0, 3),
    ROUND(-1.0 + RAND() * 4.0, 3)
FROM 
    countries c
    CROSS JOIN (SELECT 2020 AS year UNION SELECT 2021 UNION SELECT 2022 UNION SELECT 2023 UNION SELECT 2024) y
    CROSS JOIN (SELECT 1 AS month UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 
                UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 
                UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12) m
WHERE c.country_id <= 20;

-- INSERTING AGRICULTURAL DATA (Quarterly data for years 2015-2024)
INSERT INTO agricultural_indicators (
    country_id, year, quarter, cereal_production_mt, crop_production_index, 
    livestock_production_index, food_price_index, agricultural_value_added_usd,
    agri_gdp_percentage, arable_land_hectares, fertilizer_consumption_kg,
    agricultural_exports_usd, agricultural_imports_usd, food_security_index, rural_employment_rate
)
SELECT 
    c.country_id,
    y.year,
    q.quarter,
    CASE 
        WHEN c.country_code IN ('USA', 'CHN', 'IND', 'BRA') THEN ROUND(80000 + (y.year - 2015) * 2000 + RAND() * 15000, 2)
        WHEN c.country_code IN ('RUS', 'IDN', 'PAK', 'NGA', 'BGD') THEN ROUND(40000 + (y.year - 2015) * 1500 + RAND() * 10000, 2)
        WHEN c.country_code IN ('FRA', 'DEU', 'ARG', 'THA', 'VNM') THEN ROUND(25000 + (y.year - 2015) * 1000 + RAND() * 8000, 2)
        ELSE ROUND(10000 + (y.year - 2015) * 500 + RAND() * 5000, 2)
    END,
    ROUND(100 + (y.year - 2015) * 2.5 + RAND() * 8, 2),
    ROUND(100 + (y.year - 2015) * 2.0 + RAND() * 6, 2),
    ROUND(100 + (y.year - 2015) * 5 + RAND() * 15, 2),
    CASE 
        WHEN c.country_code IN ('CHN', 'IND', 'USA', 'BRA') THEN ROUND(150000 + (y.year - 2015) * 8000 + RAND() * 25000, 2)
        WHEN c.country_code IN ('IDN', 'NGA', 'PAK', 'THA', 'VNM') THEN ROUND(50000 + (y.year - 2015) * 3000 + RAND() * 15000, 2)
        ELSE ROUND(20000 + (y.year - 2015) * 1500 + RAND() * 8000, 2)
    END,
    CASE 
        WHEN c.income_group = 'Low Income' THEN ROUND(25 + RAND() * 15, 2)
        WHEN c.income_group = 'Lower Middle Income' THEN ROUND(15 + RAND() * 10, 2)
        WHEN c.income_group = 'Upper Middle Income' THEN ROUND(8 + RAND() * 7, 2)
        ELSE ROUND(2 + RAND() * 4, 2)
    END,
    CASE 
        WHEN c.country_code IN ('USA', 'IND', 'CHN', 'RUS', 'BRA') THEN ROUND(50000000 + RAND() * 20000000, 2)
        WHEN c.country_code IN ('IDN', 'NGA', 'THA', 'PAK') THEN ROUND(15000000 + RAND() * 10000000, 2)
        ELSE ROUND(5000000 + RAND() * 5000000, 2)
    END,
    ROUND(100 + (y.year - 2015) * 5 + RAND() * 50, 2),
    ROUND(15000 + (y.year - 2015) * 1200 + RAND() * 8000, 2),
    ROUND(12000 + (y.year - 2015) * 1000 + RAND() * 6000, 2),
    CASE 
        WHEN c.income_group = 'High Income' THEN ROUND(75 + RAND() * 20, 2)
        WHEN c.income_group = 'Upper Middle Income' THEN ROUND(60 + RAND() * 20, 2)
        WHEN c.income_group = 'Lower Middle Income' THEN ROUND(45 + RAND() * 20, 2)
        ELSE ROUND(30 + RAND() * 20, 2)
    END,
    CASE 
        WHEN c.income_group = 'High Income' THEN ROUND(2 + RAND() * 8, 2)
        WHEN c.income_group = 'Upper Middle Income' THEN ROUND(15 + RAND() * 15, 2)
        ELSE ROUND(30 + RAND() * 25, 2)
    END
FROM 
    countries c
    CROSS JOIN (SELECT 2015 AS year UNION SELECT 2016 UNION SELECT 2017 UNION SELECT 2018 
                UNION SELECT 2019 UNION SELECT 2020 UNION SELECT 2021 UNION SELECT 2022 
                UNION SELECT 2023 UNION SELECT 2024) y
    CROSS JOIN (SELECT 1 AS quarter UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) q
WHERE c.country_id <= 26;


-- VERIFICATION QUERIES

SELECT 'countries' AS table_name, COUNT(*) AS row_count FROM countries
UNION ALL
SELECT 'gdp_data', COUNT(*) FROM gdp_data
UNION ALL
SELECT 'inflation_rates', COUNT(*) FROM inflation_rates
UNION ALL
SELECT 'unemployment_data', COUNT(*) FROM unemployment_data
UNION ALL
SELECT 'trade_balance', COUNT(*) FROM trade_balance
UNION ALL
SELECT 'interest_rates', COUNT(*) FROM interest_rates
UNION ALL
SELECT 'agricultural_indicators', COUNT(*) FROM agricultural_indicators;


-- Query 1: GDP Growth Analysis by Region
SELECT 
    c.region,
    g.year,
    AVG(g.gdp_growth_rate) AS avg_growth_rate,
    COUNT(DISTINCT c.country_id) AS num_countries
FROM gdp_data g
JOIN countries c ON g.country_id = c.country_id
WHERE g.year >= 2020
GROUP BY c.region, g.year
ORDER BY g.year DESC, avg_growth_rate DESC;

-- Query 2: Inflation Trends for High Income Countries
SELECT 
    c.country_name,
    i.year,
    ROUND(AVG(i.inflation_rate), 2) AS avg_inflation,
    ROUND(MAX(i.inflation_rate), 2) AS peak_inflation,
    ROUND(MIN(i.inflation_rate), 2) AS lowest_inflation
FROM inflation_rates i
JOIN countries c ON i.country_id = c.country_id
WHERE c.income_group = 'High Income' AND i.year = 2024
GROUP BY c.country_name, i.year
ORDER BY avg_inflation DESC
LIMIT 10;

-- Query 3: Trade Balance Performance
SELECT 
    c.country_name,
    t.year,
    ROUND(SUM(t.exports_usd)/1000000, 2) AS total_exports_millions,
    ROUND(SUM(t.imports_usd)/1000000, 2) AS total_imports_millions,
    ROUND(SUM(t.trade_balance_usd)/1000000, 2) AS net_trade_balance_millions
FROM trade_balance t
JOIN countries c ON t.country_id = c.country_id
WHERE t.year BETWEEN 2022 AND 2024
GROUP BY c.country_name, t.year
HAVING SUM(t.trade_balance_usd) > 0
ORDER BY net_trade_balance_millions DESC;

-- Query 4: Unemployment Rate Trends with Moving Average
SELECT 
    c.country_name,
    u.year,
    u.quarter,
    u.unemployment_rate,
    ROUND(AVG(u.unemployment_rate) OVER (
        PARTITION BY u.country_id 
        ORDER BY u.year, u.quarter 
        ROWS BETWEEN 3 PRECEDING AND CURRENT ROW
    ), 2) AS moving_avg_4q
FROM unemployment_data u
JOIN countries c ON u.country_id = c.country_id
WHERE c.country_code IN ('USA', 'DEU', 'JPN', 'GBR', 'FRA')
    AND u.year >= 2022
ORDER BY c.country_name, u.year, u.quarter;

-- Query 5: Interest Rate and Inflation Correlation
SELECT 
    c.country_name,
    ir.year,
    ROUND(AVG(ir.central_bank_rate), 2) AS avg_policy_rate,
    ROUND(AVG(inf.inflation_rate), 2) AS avg_inflation,
    ROUND(AVG(ir.real_interest_rate), 2) AS avg_real_rate
FROM interest_rates ir
JOIN inflation_rates inf ON ir.country_id = inf.country_id 
    AND ir.year = inf.year 
    AND ir.month = inf.month
JOIN countries c ON ir.country_id = c.country_id
WHERE ir.year = 2024
GROUP BY c.country_name, ir.year
ORDER BY avg_policy_rate DESC;

-- Query 6: Agricultural Production Analysis by Region
SELECT 
    c.region,
    a.year,
    ROUND(AVG(a.cereal_production_mt), 2) AS avg_cereal_production_mt,
    ROUND(AVG(a.crop_production_index), 2) AS avg_crop_index,
    ROUND(AVG(a.agri_gdp_percentage), 2) AS avg_agri_gdp_share,
    COUNT(DISTINCT c.country_id) AS num_countries
FROM agricultural_indicators a
JOIN countries c ON a.country_id = c.country_id
WHERE a.year >= 2020
GROUP BY c.region, a.year
ORDER BY a.year DESC, avg_cereal_production_mt DESC;

-- Query 7: Food Security vs Agricultural Productivity
SELECT 
    c.country_name,
    c.income_group,
    ROUND(AVG(a.food_security_index), 2) AS avg_food_security,
    ROUND(AVG(a.crop_production_index), 2) AS avg_crop_productivity,
    ROUND(AVG(a.agricultural_exports_usd - a.agricultural_imports_usd), 2) AS net_agri_trade_usd,
    ROUND(AVG(a.rural_employment_rate), 2) AS avg_rural_employment
FROM agricultural_indicators a
JOIN countries c ON a.country_id = c.country_id
WHERE a.year BETWEEN 2022 AND 2024
GROUP BY c.country_name, c.income_group
ORDER BY avg_food_security DESC
LIMIT 15;

-- Query 8: Agricultural Trade Balance and Food Prices
SELECT 
    c.country_name,
    a.year,
    ROUND(AVG(a.food_price_index), 2) AS avg_food_price_index,
    ROUND(SUM(a.agricultural_exports_usd), 2) AS total_agri_exports,
    ROUND(SUM(a.agricultural_imports_usd), 2) AS total_agri_imports,
    ROUND(SUM(a.agricultural_exports_usd - a.agricultural_imports_usd), 2) AS net_agri_balance,
    CASE 
        WHEN SUM(a.agricultural_exports_usd) > SUM(a.agricultural_imports_usd) THEN 'Net Exporter'