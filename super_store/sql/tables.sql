\c superstore

-- Create Locations tables : market, region, state

CREATE TABLE market (
    market_id SERIAL PRIMARY KEY,
    market_name TEXT
);

CREATE TABLE region (
    region_id SERIAL PRIMARY KEY,
    region_name TEXT
);

CREATE TABLE state (
    state_id SERIAL PRIMARY KEY,
    state_name TEXT
);

-- create Date tables : dates (one or 2 for order and shipping?)

-- create Product tables: product_id & product_name, category, sub-category,  segment

-- create Customer tables: customer_id & Customer_name

-- create Shippinge tables: shipping_mode, order priority 


-- create fact table with all new columns



"""psql sql/tables.sql"""