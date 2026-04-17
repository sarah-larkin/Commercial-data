
from connection import create_connection, close_cursor_connection
import csv
from config import LOAD_DATA_DIR

def seed(file_name_str): 
    conn = create_connection()
    cur = conn.cursor() #open a cursor to perform database operations

    with open( LOAD_DATA_DIR / file_name_str, 'r') as file: 
        data_reader = csv.reader(file)
        next(data_reader) #skip the header row 

        for row in data_reader: 
            cur.execute(""" 
                         INSERT INTO dim_location
                         (market_name, region_name, state_name)
                         VALUES
                         (%s, %s, %s)
                         """, row)
    #%s = string values

    #commit and close connection
    close_cursor_connection(conn, cur)

    print("Data is ingested sucessfully")


#TODO: not fully scalable yet due to SQL syntax - check options 

if __name__ == "__main__": 
    seed('dim_location_table.csv')


# #open a cursor to perform database operations
# cur = conn.cursor() 

# #Execute a query
# cur.execute("--SQL...")

# #Retrieve query results
# records = cur.fethall() 





# conn = psycopg2.connect(DSN)
# try:
#     # Perform operations
#     with conn.cursor() as cur:
#         cur.execute(SQL)
#     conn.commit()
# finally:
#     conn.close() # Ensures it closes even if an error occurs