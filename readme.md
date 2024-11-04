# Web Scraper

A simple Ruby-based web scraper for handling JSON data. This script fetches data from a specified URL, filters it by specific keys if provided, and saves the output to a CSV file.

## Prerequisites

Ensure you have the following gems installed:

- `httparty`
- `json`
- `csv`

Install missing gems by running:

```bash
gem install httparty json csv
```

## Usage

The basic syntax to run the scraper:

```bash
ruby scraper.rb <URL> [keys] file_output_name
```

- <URL> (required): The API endpoint URL from which to retrieve JSON data.
- [keys] (optional): A comma-separated list of target keys to filter the data. If not provided, all keys from the JSON data will be saved.
- file_output_name (optional): you can put the file name. If not provided, it will use default name output.csv.

## Example Commands

1. Filter by specific keys
```bash
ruby scraper.rb http://gco.iarc.fr/gateway_prod/api/globocan/v3/2022/meta/populations/all/ "label,area_label,area_code"
```
This command fetches data from the URL and only includes the label, area_label, and area_code keys in the output CSV.

2. Fetch all data without filtering
```bash
ruby scraper.rb http://gco.iarc.fr/gateway_prod/api/globocan/v3/2022/meta/populations/all/
```
This command retrieves all data and includes all keys in the output.

## Output

The results are saved to output.csv in the current directory. You can specify a different filename by modifying the output_file variable in scraper.rb.

## Video Tutorial

Check out this video tutorial on how to use the scraper: [Watch Video](https://www.youtube.com/watch?v=YcOrNxjRpIQ)



