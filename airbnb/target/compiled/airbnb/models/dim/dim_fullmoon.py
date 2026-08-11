import holidays
import pandas as pd

def model(dbt, session):
    dbt.config(
        materialized="table",
        packages=["holidays", "pandas", "pyarrow", "numpy"]
    )

    orders_df = dbt.ref("seed_full_moon_dates")
    df = orders_df.to_pandas()

    # 1. converte a coluna para datetime antes de checar
    df["FULL_MOON_DATE"] = pd.to_datetime(df["FULL_MOON_DATE"])

    # 2. cria o calendário de feriados UMA vez
    german_holidays = holidays.Germany()

    # 3. usa .dt.date (tipo que a lib entende) e trata nulos
    df["IS_HOLIDAY"] = df["FULL_MOON_DATE"].dt.date.apply(
        lambda d: (d in german_holidays) if pd.notna(d) else False
    )

    return df


# This part is user provided model code
# you will need to copy the next section to run the code
# COMMAND ----------
# this part is dbt logic for get ref work, do not modify

def ref(*args, **kwargs):
    refs = {"seed_full_moon_dates": "AIRBNB.DEV.seed_full_moon_dates"}
    key = '.'.join(args)
    version = kwargs.get("v") or kwargs.get("version")
    if version:
        key += f".v{version}"
    dbt_load_df_function = kwargs.get("dbt_load_df_function")
    return dbt_load_df_function(refs[key])


def source(*args, dbt_load_df_function):
    sources = {}
    key = '.'.join(args)
    return dbt_load_df_function(sources[key])


config_dict = {}
meta_dict = {}


class config:
    def __init__(self, *args, **kwargs):
        pass

    @staticmethod
    def get(key, default=None):
        return config_dict.get(key, default)

    @staticmethod
    def meta_get(key, default=None):
        return meta_dict.get(key, default)

class this:
    """dbt.this() or dbt.this.identifier"""
    database = "AIRBNB"
    schema = "DEV"
    identifier = "dim_fullmoon"
    
    def __repr__(self):
        return 'AIRBNB.DEV.dim_fullmoon'


class dbtObj:
    def __init__(self, load_df_function) -> None:
        self.source = lambda *args: source(*args, dbt_load_df_function=load_df_function)
        self.ref = lambda *args, **kwargs: ref(*args, **kwargs, dbt_load_df_function=load_df_function)
        self.config = config
        self.this = this()
        self.is_incremental = False

# COMMAND ----------


