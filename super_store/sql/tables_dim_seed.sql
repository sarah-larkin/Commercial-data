\c superstore

/* The dims tables contain multiple columns. These could be separated out further. 
Given the size of the dataset and purpose of this project, they will remain combined 
at this point.*/

DROP TABLE IF EXISTS dim_location;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS fact_orders;

------------------------------------------------------------
-- DIMS TABLES
------------------------------------------------------------

-- Create Locations table : market, region, state
CREATE TABLE IF NOT EXISTS dim_location (
    location_id SERIAL PRIMARY KEY,
    market_name TEXT,
    region_name TEXT,
    state_name TEXT
);


-- create Product table: product_id & product_name, category, sub-category,  segment
--(data set is small enough that this can be in one table)
CREATE TABLE IF NOT EXISTS dim_product (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    sub_category TEXT
);

-- create Customer table: customer_id & Customer_name
CREATE TABLE IF NOT EXISTS dim_customer (
    customer_id SERIAL PRIMARY KEY,
    customer_name TEXT,
    segment TEXT
);


------------------------------------------------------------
-- FACT TABLE
------------------------------------------------------------

-- create fact table with all new columns
CREATE TABLE IF NOT EXISTS fact_orders (
    order_id TEXT,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(20),
    customer_id INT REFERENCES dim_customer(customer_id),
    location_id INT REFERENCES dim_location(location_id),
    product_id INT REFERENCES dim_product(product_id),
    sales NUMERIC(6,2),
    quantity INT,
    discount NUMERIC(2,4),
    profit NUMERIC(6,2),
    shipping_cost NUMERIC(6,2),
    order_priority TEXT,
    order_prep_days TEXT,
    profit_margin NUMERIC(6,2),
    "GM2_%" NUMERIC(6,2),
    loss_making TEXT, 
    discount_range TEXT,
    order_value_range TEXT
);

/*
 psql -f sql/tables_dim_seed.sql
*/
