import requests
import pandas as pd

# Example DBRepo API base URL
BASE_URL = "https://dbrepo.tuwien.ac.at/api"


def fetch_view(view_name):
    """
    Fetch a SQL view from DBRepo API and return a pandas dataframe.
    """

    url = f"{BASE_URL}/views/{view_name}"

    print(f"Requesting: {url}")

    try:
        response = requests.get(url)

        response.raise_for_status()

        data = response.json()

        df = pd.DataFrame(data)

        print(f"Loaded {len(df)} rows.")

        return df

    except requests.exceptions.RequestException as e:
        print(f"API request failed: {e}")

        return None


def preview_dataframe(df, rows=5):
    """
    Print dataframe preview.
    """

    if df is not None:
        print(df.head(rows))
    else:
        print("No dataframe available.")


if __name__ == "__main__":

    # Example SQL views prepared in sql/views.sql
    views_to_test = [
        "yearly_population_summary",
        "district_population_summary",
        "nationality_population_summary"
    ]

    for view in views_to_test:

        print("\n==============================")
        print(f"Testing view: {view}")
        print("==============================")

        dataframe = fetch_view(view)

        preview_dataframe(dataframe)
