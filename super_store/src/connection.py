# pip install psycopg2-binary
## pip install psycopg2

import psycopg2
import os                               #to access the env variables
from dotenv import load_dotenv          #to read the .env file

load_dotenv()

username = os.environ["PG_USERNAME"]
database = os.environ["PG_DATABASE"]

#connect to db
def create_connection(): 
    conn = psycopg2.connect(dbname=database, user=username)
    return conn 

#option to use a context manager to close connection automatically? 

#close connection
def close_cursor_connection(conn, cur): 
    #commit and close connection
    conn.commit() # save in db
    cur.close()
    conn.close()



