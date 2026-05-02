import pandas as pd
from pathlib import Path

RAW_DATA = Path("data/vie-bez-pop-sex-age5-stk-nat-geo4-2002f.csv")
OUTPUT_DATA = Path("data/processed_population_long_v1.csv")

def main():
    df = pd.read_csv(RAW_DATA, sep=";", skiprows=1)

    nationality_columns = ["AUT", "EEA", "REU", "TCN"]

    df_long = df.melt(
        id_vars=[
            "NUTS",
            "DISTRICT_CODE",
            "SUB_DISTRICT_CODE",
            "REF_YEAR",
            "REF_DATE",
            "SEX",
            "AGE5"
        ],
        value_vars=nationality_columns,
        var_name="nationality_group",
        value_name="population_count"
    )

    df_long["REF_DATE"] = pd.to_datetime(
        df_long["REF_DATE"].astype(str),
        format="%Y%m%d"
    )

    df_long = df_long.sort_values(
        by=["DISTRICT_CODE", "SEX", "AGE5", "nationality_group", "REF_YEAR"]
    )

    OUTPUT_DATA.parent.mkdir(parents=True, exist_ok=True)
    df_long.to_csv(OUTPUT_DATA, index=False)

    print(f"Saved processed dataset to {OUTPUT_DATA}")
    print(f"Rows: {len(df_long)}")
    print(f"Columns: {list(df_long.columns)}")

if __name__ == "__main__":
    main()
