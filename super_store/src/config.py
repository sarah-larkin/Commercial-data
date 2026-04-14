from pathlib import Path

#create path object 
#PROJECT_ROOT = Path.cwd()   #current working directory
PROJECT_ROOT = Path(__file__).parents[1]     #super_store/src/config.py  --> take it back 2 to super_store (.parent.parent)
RAW_DATA = PROJECT_ROOT / "data/01_raw/store_data.csv"
CLEAN_DATA_DIR = PROJECT_ROOT / "data/02_clean/"
CLEAN_DATA = PROJECT_ROOT / "data/02_clean/01_cleaned_store_data.parquet"







# #see parts of a path 
# print(PROJECT_ROOT.name)    # filename no directory
# print(PROJECT_ROOT.stem)    # filename no extension
# print(PROJECT_ROOT.suffix)  # file extension
# print(PROJECT_ROOT.anchor)  # path pre directories eg. 'C:\\'
# print(PROJECT_ROOT.parent)  # full path up to the dir containing the current file (eg. one previous)
# print(PROJECT_ROOT.parent.parent)   # (two previous)
# print(PROJECT_ROOT.parents[0])      # same effect as parent
# print(PROJECT_ROOT.parents[1])      # same effect as parent repeated (two previous)

# #Alternative:
# print(f"You can find me here: {Path(__file__).parent.parent}!")
# print(Path(__file__).resolve().parents[1]) #use __file__ to get to this specific file, then use parent to move back trhough dirs 

