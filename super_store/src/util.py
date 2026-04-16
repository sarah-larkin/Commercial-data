import pandas as pd

def format_df(input_df):
    data_dict = input_df.to_dict(orient='records')
    return data_dict



