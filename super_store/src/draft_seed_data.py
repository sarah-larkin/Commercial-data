from connection import create_connection, close_connection   #from src
from util import format_df

def seed(): 
    conn = create_connection()
    
    #location_data = format_df(df_location)  #--> can't take data from notebook

    conn.run("""
        INSERT INTO dim_location
             (market, region, state)
        VALUES
             (:market, :region, :state)  
    """)

    #add logic here

    close_connection(conn)


# #test:
# records = [
#     (row.state, row.region, row.market)
#     for row in df_location.itertuples(index=False)
# ]

# def seed_location(df_location):
#     conn = create_connection()
#     cur = conn.cursor()

#     records = [
#         (row.state, row.region, row.market)
#         for row in df_location.itertuples(index=False)
#     ]

#     try:
#         cur.executemany(
#             """
#             INSERT INTO dim_location (state, region, market)
#             VALUES (%s, %s, %s);
#             """,
#             records
#         )
#         conn.commit()
#     except Exception:
#         conn.rollback()
#         raise
#     finally:
#         cur.close()
#         conn.close()

""" to see: 
psql            - access psql
\c superstore   - connect to db
\d region       - see table relations
q               - to quit 
"""
