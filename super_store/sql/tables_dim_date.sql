\c superstore

-- create Date table : date range, date, quarter etc. 
-- (this would only need to be created once and not updated)

DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_date (
full_date DATE NOT NULL,
year INT NOT NULL,
month INT NOT NULL,
day INT NOT NULL,
month_name VARCHAR(10),
day_name VARCHAR(10),
quarter VARCHAR(2),
year_quarter VARCHAR(7),
year_month VARCHAR(20),
weekday_weekend VARCHAR(20)
); 


INSERT INTO dim_date
    (full_date, year, month, day, month_name, day_name, quarter, year_quarter, year_month, 
    weekday_weekend)
SELECT
    -- date
    datum as Date,
    -- split date
    extract(year from datum) AS Year,
    extract(month from datum) AS Month,
    extract(day from datum) AS Day,
    -- date names 
    to_char(datum, 'TMMonth') AS MonthName,
    to_char(datum, 'TMDay') AS WeekdayName,
    -- quarters
    'Q' || to_char(datum, 'Q') AS Quartal,
    to_char(datum, 'yyyy/"Q"Q') AS YearQuartal,
    to_char(datum, 'yyyy/mm') AS YearMonth,
    -- Weekend
    CASE WHEN extract(isodow from datum) in (6, 7) THEN 'Weekend' ELSE 'Weekday' END AS Weekend
FROM (
    -- 4 years 365 * 4 + week
    SELECT '2011, 1, 1'::DATE + sequence.day AS datum
    FROM generate_series(0,1647) AS sequence(day)
    GROUP BY sequence.day
    ) DQ
order by 1;



SELECT * FROM dim_date
LIMIT 5;