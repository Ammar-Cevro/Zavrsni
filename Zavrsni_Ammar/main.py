from etl.extract.extractor import extract
from etl.transform.transformer import transform
from etl.load.loader import load

dataset_path = "data\Employee.csv"
table_name = "employee"
connection_string = "mssql+pyodbc://DESKTOP-F3FJIDA/Ammar?driver=ODBC+Driver+17+for+SQL+Server"

df = extract(dataset_path)
df_clean = transform(df)
load(df_clean, table_name, connection_string)