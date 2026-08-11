import holidays
import pandas as pd

def model(dbt, session):
    dbt.config(
        materialized="table",
        packages=["holidays", "pandas", "pyarrow", "numpy"],
        enabled=False
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