import pandas as pd

def extract(file_path):

    file_path = file_path

    print("*************    Extracting data     *************")
    print()
    data = pd.read_csv(file_path)
    print()
    print(f"*************   Finished extracting data    *************")

    return data


