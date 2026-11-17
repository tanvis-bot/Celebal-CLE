import requests
import json
import logging

logger = logging.getLogger(__name__)


def fetch_api_data(url, output_path):
    try:
        logger.info("Fetching data from API...")

        response = requests.get(url, timeout=10)
        response.raise_for_status()

        data = response.json()

        with open(output_path, "w") as file:
            json.dump(data, file, indent=4)

        logger.info("Data fetched and saved successfully!")
        return data

    except requests.exceptions.RequestException as error:
        logger.error(f"API request failed: {error}")

    except (ValueError, json.JSONDecodeError) as error:
        logger.error(f"Invalid JSON response: {error}")

    except OSError as error:
        logger.error(f"File operation failed: {error}")

    return None