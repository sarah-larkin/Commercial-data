\c superstore

""" The dims tables contain multiple columns. These could be separated out further. 
Given the size of the dataset and purpose of this project, they will remain combined at this point."""

-- Create Locations table : market, region, state
CREATE TABLE dim_location (
    location_id SERIAL PRIMARY KEY,
    market_name TEXT,
    region_name TEXT,
    state_name TEXT
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
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    location_id,
    product_id,
    sales,
    quantity,
    discount,
    profit,
    shipping_cost,
    order_priority,
    order_prep_days,
    profit_margin,
    GM2 %,
    loss_making,
    discount_range,
    order_value_range
);

"""
psql sql/tables.sql
"""