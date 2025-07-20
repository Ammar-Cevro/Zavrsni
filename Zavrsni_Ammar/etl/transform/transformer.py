import pandas


def transform(data):

    print("*************    Cleaning data     *************")
    print()
    data = data.dropna() #Dropping null values

    data = data.drop_duplicates() #Dropping duplicated rows

    data = data.reset_index(drop=True) #Reseting index
    print()
    print("*************    Finished cleaning   *************")
    return data

