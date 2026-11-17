# Week 2 – Python Basics
**Celebal Technologies – Celebal Learning Engagement**

## Objective

Practise Python-based data handling using Pandas, perform data cleaning, work with public REST APIs, and build reusable functions with logging and error handling.

## Task 1 – Read CSV, JSON and Parquet using Pandas

Used the NYC Yellow Taxi January 2016 sample dataset containing 50,000 records and 19 columns.

- Read CSV files using `pd.read_csv()`.
- Converted the DataFrame into JSON using `to_json()`.
- Read JSON files using `pd.read_json()`.
- Converted the DataFrame into Parquet using `to_parquet()`.
- Read Parquet files using `pd.read_parquet()`.

## Task 2 – Data Cleaning and Parquet Storage

Inspected and cleaned the taxi dataset.

- Checked missing values using `isnull().sum()`.
- Handled missing values using `dropna()`.
- Converted pickup and drop-off timestamps using `pd.to_datetime()`.
- Checked duplicate records using `duplicated()`.
- Removed duplicates using `drop_duplicates()`.
- Saved the cleaned dataset in Parquet format.

**Cleaning results:**

| Check | Result |
|---|---:|
| Original records | 50,000 |
| Missing values | 0 |
| Duplicate rows | 0 |
| Final records | 50,000 |
| Columns | 19 |

Output: `yellow_tripdata_cleaned.parquet`

## Task 3 – Public REST API

Used the JSONPlaceholder public REST API to retrieve sample post data.

API endpoint:

`https://jsonplaceholder.typicode.com/posts`

- Sent GET requests using the `requests` library.
- Checked HTTP response status.
- Converted the response into JSON.
- Inspected the API response.
- Saved the API data into a JSON file.
- Verified that 100 posts were saved successfully.

Output: `api_posts.json`

## Task 4 – Reusable Function with Logging and Error Handling

Created a reusable function named `fetch_api_data()`.

The function:

- Accepts an API URL and output file path.
- Fetches data using HTTP GET requests.
- Handles unsuccessful HTTP responses using `raise_for_status()`.
- Converts the response into JSON.
- Saves the response to a file.
- Uses logging to record successful operations and errors.
- Handles request, JSON and file-related exceptions.

Tested the function with:
- A valid API endpoint, which returned 100 posts successfully.
- An invalid API endpoint, which returned HTTP 404 and was handled correctly.

## Technologies and Libraries

- Python
- Pandas
- Requests
- JSON
- Logging
- PyArrow
- Jupyter Notebook

## Project Structure

```text
Week-02-Python/
├── data/
│   ├── raw/
│   │   ├── yellow_tripdata_sample.csv
│   │   ├── yellow_tripdata_sample.json
│   │   ├── yellow_tripdata_sample.parquet
│   │   ├── api_posts.json
│   │   └── api_posts_function.json
│   └── processed/
│       └── yellow_tripdata_cleaned.parquet
├── notebooks/
│   └── 01_reading_data.ipynb
├── scripts/
│   └── api_utils.py
└── README.md
```

## Completion Status

- [x] Task 1 – Read CSV, JSON and Parquet using Pandas
- [x] Task 2 – Clean nulls, dates and duplicates; save as Parquet
- [x] Task 3 – Pull data from a public REST API and save JSON
- [x] Task 4 – Create a reusable function with logging and error handling

**Week 2 – Completed**