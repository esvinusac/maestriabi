# librearías a utilizar
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

def getColumnsDataTypes(df):
    """
    Descripción: Función para obtener los tipos de datos de cada columna de un dataframe.
    """
    categoric_vars = []
    discrete_vars = []
    continues_vars = []

    for colname in df.columns:
        if(df[colname].dtype == 'object'):
            categoric_vars.append(colname)
        else:
            cantidad_valores = len(df[colname].value_counts())
            if(cantidad_valores <= 30):
                discrete_vars.append(colname)
            else:
                continues_vars.append(colname)

    return categoric_vars, discrete_vars, continues_vars



def plotCategoricalVals(df, categoric_vars, y):
    """
    Descripción: Función para desplegar variables categóricas.
    """

    for column in categoric_vars:
        plt.figure(figsize=(12,6))
        plot = sns.countplot(x=df[column], hue=df[y])
        plt.show()


def getNumericColNans(df):
    """
    Descripción: Función para obtener las columnas del dataframe que son numéricas 
    """
    colnames = df.columns
    nums_cols_na = []
    for col in colnames:
        if((df[col].isnull().sum() > 0) and ((df[col].dtypes == 'int64') or (df[col].dtypes == 'float64'))):
            nums_cols_na.append(col)
    return nums_cols_na


def getCategoricalColNans(df):
    """
    Descripción: Función que retorna las columnas del dataframe que son categóricas y que tienen NAs
    """
    colnames = df.columns
    cats_cols_na = []
    for col in colnames:
        if((df[col].isnull().sum() > 0) and (df[col].dtypes == 'object')):
            cats_cols_na.append(col)
    return cats_cols_na



def getColNansDict(df, colnames):
    """
    Descripción: Función que retorna un diccionario con las columnas especificadas del dataframe y la cantidad de NAs en ellas
    """
    cols_na_tot = {}
    for col in colnames:
        cols_na_tot[col] = df[col].isnull().sum()

    return cols_na_tot



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