"""
DBRepo API loader for the Vienna demographic forecasting project.

This script retrieves data from DBRepo views using the official DBRepo
Python client. It does not read local CSV files.

Before running:
    python -m pip install dbrepo==1.13.3 pandas

Run:
    python src/dbrepo_api_loader.py
"""

from __future__ import annotations

from dataclasses import dataclass
from typing import Dict

import pandas as pd


DBREPO_ENDPOINT = "https://test.dbrepo.tuwien.ac.at"
DATABASE_ID = "38707917-e942-45c3-a3dd-d2bfc1c106af"

VIEWS: Dict[str, str] = {
    "population_by_district": "1448ed5a-3777-482c-8857-ea83a590f416",
    "population_by_nationality": "9517ff56-7559-4999-88db-0236bcffcdd4",
    "population_pyramid_base": "40d0e45f-3e41-4c0d-8c2e-41d8967be4c2",
}


@dataclass
class ViewResult:
    view_name: str
    view_id: str
    row_count: int
    columns: list[str]


def get_client():
    try:
        from dbrepo.RestClient import RestClient
    except ImportError as exc:
        raise SystemExit(
            "The DBRepo Python client is not installed. "
            "Install it with: python -m pip install dbrepo==1.13.3"
        ) from exc

    return RestClient(endpoint=DBREPO_ENDPOINT)


def fetch_view(view_name: str, size: int = 1000000) -> pd.DataFrame:
    if view_name not in VIEWS:
        raise ValueError(f"Unknown view name: {view_name}. Expected one of {list(VIEWS)}")

    client = get_client()
    view_id = VIEWS[view_name]

    print(f"Fetching view: {view_name}")
    print(f"Database ID: {DATABASE_ID}")
    print(f"View ID: {view_id}")

    df = client.get_view_data(
        database_id=DATABASE_ID,
        view_id=view_id,
        size=size,
    )

    if not isinstance(df, pd.DataFrame):
        df = pd.DataFrame(df)

    print(f"Loaded {len(df)} rows and {len(df.columns)} columns.")
    print(df.head())

    return df


def verify_views() -> list[ViewResult]:
    results: list[ViewResult] = []

    for view_name, view_id in VIEWS.items():
        try:
            df = fetch_view(view_name)
            results.append(
                ViewResult(
                    view_name=view_name,
                    view_id=view_id,
                    row_count=len(df),
                    columns=list(df.columns),
                )
            )
            print(f"SUCCESS: {view_name}\n")
        except Exception as exc:
            print(f"FAILED: {view_name}")
            print(f"Reason: {exc}\n")

    return results


if __name__ == "__main__":
    summary = verify_views()

    print("\nDBRepo view verification summary")
    print("=" * 40)

    for result in summary:
        print(f"{result.view_name}: {result.row_count} rows")
        print(f"Columns: {result.columns}")
