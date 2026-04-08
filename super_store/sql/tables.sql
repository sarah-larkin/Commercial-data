\c superstore

-- Create Locations tables 

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



-- psql sql/tables.sql