-- \c superstore

-- create Date table : date range, date, quarter etc. 
-- (this would only need to be created once and not updated)

DROP TABLE IF EXISTS dim_date;

CREATE TABLE dim_date (
full_date DATE NOT NULL,
year INT NOT NULL,
month INT NOT NULL,
day INT NOT NULL,
month_name VARCHAR(10),
day_name VARCHAR(10)
); 


INSERT INTO dim_date(
    SELECT
        -- date
        datum as Date,
        -- split date
        extract(year from datum) AS Year,
        extract(month from datum) AS Month,
        extract(day from datum) AS Day,
        -- date names 
        to_char(datum, 'TMMonth') AS MonthName,
        to_char(datum, 'TMDay') AS WeekdayName
        -- extract(doy from datum) AS DayOfYear,
        -- -- ISO calendar week
        -- extract(week from datum) AS CalendarWeek,
        -- to_char(datum, 'dd. mm. yyyy') AS FormattedDate,
        -- 'Q' || to_char(datum, 'Q') AS Quartal,
        -- to_char(datum, 'yyyy/"Q"Q') AS YearQuartal,
        -- to_char(datum, 'yyyy/mm') AS YearMonth,
        -- -- ISO calendar year and week
        -- to_char(datum, 'iyyy/IW') AS YearCalendarWeek,
        -- -- Weekend
        -- CASE WHEN extract(isodow from datum) in (6, 7) THEN 'Weekend' ELSE 'Weekday' END AS Weekend,
        -- -- -- Fixed holidays 
        -- --     -- for America
        -- --     CASE WHEN to_char(datum, 'MMDD') IN ('0101', '0704', '1225', '1226')
        -- --     THEN 'Holiday' ELSE 'No holiday' END
        -- --     AS AmericanHoliday,
        -- --     -- for Austria
        -- -- CASE WHEN to_char(datum, 'MMDD') IN 
        -- --     ('0101', '0106', '0501', '0815', '1101', '1208', '1225', '1226') 
        -- --     THEN 'Holiday' ELSE 'No holiday' END 
        -- --     AS AustrianHoliday,
        -- --     -- for Canada
        -- --     CASE WHEN to_char(datum, 'MMDD') IN ('0101', '0701', '1225', '1226')
        -- --     THEN 'Holiday' ELSE 'No holiday' END 
        -- --     AS CanadianHoliday,
        -- -- Some periods of the year, adjust for your organisation and country
        -- -- CASE WHEN to_char(datum, 'MMDD') BETWEEN '0701' AND '0831' THEN 'Summer break'
        -- --      WHEN to_char(datum, 'MMDD') BETWEEN '1115' AND '1225' THEN 'Christmas season'
        -- --      WHEN to_char(datum, 'MMDD') > '1225' OR to_char(datum, 'MMDD') <= '0106' THEN 'Winter break'
        -- -- 	ELSE 'Normal' END
        -- -- 	AS Period,
        -- -- ISO start and end of the week of this date
        -- datum + (1 - extract(isodow from datum))::integer AS CWStart,
        -- datum + (7 - extract(isodow from datum))::integer AS CWEnd,
        -- -- Start and end of the month of this date
        -- datum + (1 - extract(day from datum))::integer AS MonthStart,
        -- (datum + (1 - extract(day from datum))::integer + '1 month'::interval)::date - '1 day'::interval AS MonthEnd
    FROM (
        -- There are 3 leap years in this range, so calculate 365 * 10 + 3 records
        SELECT '2011, 1, 1'::DATE + sequence.day AS datum
        FROM generate_series(0,1645) AS sequence(day)
        GROUP BY sequence.day
        ) DQ
    order by 1
);



SELECT * FROM dim_date
LIMIT 5;