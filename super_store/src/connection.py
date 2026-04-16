#pip install PG8000
#pip install python-dotenv

import os                               #to access the env variables
from dotenv import load_dotenv          #to read the .env file
from pg8000.native import Connection    #to connect to the DB


load_dotenv()

username = os.environ["PG_USERNAME"]
database = os.environ["PG_DATABASE"]

def create_connection():
    conn = Connection(
        username,               #positional arg
        database=database
    )
    return conn

def close_connection(conn): 
    conn.close()

