\c superstore

""" The dims tables contain multiple columns. 
These could be separated out further. 
Given the size of the dataset and purpose of this project
they will remain combined at this point."""

-- Create Locations table : market, region, state

CREATE TABLE dim_location (
    location_id SERIAL PRIMARY KEY,
    market_name TEXT,
    region_name TEXT,
    state_name TEXT
);

-- create Date table : date range, date, quarter etc. 
-- (this would only need to be created once and not updated)
CREATE TABLE dim_date (
    #TODO: decide date table format
);

-- create Product table: product_id & product_name, category, sub-category,  segment
--(data set is small enough that this can be in one table)

CREATE TABLE dim_product (
    product_id TEXT,
    product_name TEXT,
    category TEXT,
    sub-category TEXT
);


-- create Customer table: customer_id & Customer_name

CREATE TABLE dim_customer (
    customer_id SERIAL PRIMARY KEY,
    customer_name TEXT,
    segment TEXT
);


-- create fact table with all new columns

CREATE TABLE fact_orders (
    #TODO: complete fact table
);

"""psql sql/tables.sql"""