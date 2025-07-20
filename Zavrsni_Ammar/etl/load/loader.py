from sqlalchemy import create_engine

def load(data, table, connection_string):

    engine = create_engine(connection_string)
    data.to_sql(table, con=engine, if_exists='replace', index=False)
    print(f"Data loaded to table: {table}")

