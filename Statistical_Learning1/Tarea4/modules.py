def getNumericColNans(df):
    colnames = df.columns
    nums_cols_na = []
    for col in colnames:
        if((df[col].isnull().sum() > 0) and ((df[col].dtypes == 'int64') or (df[col].dtypes == 'float64'))):
            nums_cols_na.append(col)
    return nums_cols_na


def getDtypes(dataset):
    """
    función para determinar el tipo de dato de cada columna dentro del Datasaet.
    """
    numeric_cols = []
    categoric_cols = []
    date_cols = []
    for col in dataset.columns:
        if(dataset[col].dtype == "object"):
            categoric_cols.append(col)
        elif((dataset[col].dtype == "int64") or (dataset[col].dtype == "float64")):
            numeric_cols.append(col)
        else:
            date_cols.append(col)
    return numeric_cols, categoric_cols, date_cols



def getCategoricalCols(df):
    """
    función que retorna las columnas que son categoricas
    """
    colnames = df.columns
    cats_cols = []
    for col in colnames:
        if(df[col].dtypes == 'object'):
            cats_cols.append(col)
    return cats_cols



def getCategoricalColNans(df):
    """
    función que retorna las columnas que son categoricas y que tienen NAs
    """
    colnames = df.columns
    cats_cols_na = []
    for col in colnames:
        if((df[col].isnull().sum() > 0) and (df[col].dtypes == 'object')):
            cats_cols_na.append(col)
    return cats_cols_na



def getColNansDict(df, colnames):
    """
    retorna un diccionario con las columas especificadas y la cantidad de NAs en ellas
    """
    cols_na_tot = {}
    for col in colnames:
        cols_na_tot[col] = df[col].isnull().sum()

    return cols_na_tot