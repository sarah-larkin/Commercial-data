from connection import create_connection, close_connection   #from src

def seed(): 
    conn = create_connection()

    conn.run("DROP TABLE IF EXISTS market;")
    conn.run("DROP TABLE IF EXISTS region;")
    conn.run("DROP TABLE IF EXISTS state;")

    conn.run("""
        CREATE TABLE market (
            market_id SERIAL PRIMARY KEY,
            market_name TEXT
        );
    """)

    conn.run("""
        CREATE TABLE region (
            region_id SERIAL PRIMARY KEY,
            region_name TEXT
        );
    """)

    conn.run("""
        CREATE TABLE state (
            state_id SERIAL PRIMARY KEY,
            state_name TEXT
        );
    """)


    close_connection(conn)


#TODO: change seeing to entering data only (not creating tables)

""" to see: 
psql            - access psql
\c superstore   - connect to db
\d region       - see table relations
q               - to quit 
"""
