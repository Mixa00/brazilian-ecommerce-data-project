# C# ETL Notes

This document describes the initial C# console application used in the project.

## Project

The C# console app is located in:

`src/OlistEtl`

## Current Functionality

The application accepts a CSV file path as a command-line argument and prints basic file information:

- file name
- header row
- total line count

The line count includes the header row.

## Example Usage

```bash
dotnet run --project src/OlistEtl -- data/raw/olist_customers_dataset.csv
```

## Example Output

```text
File: olist_customers_dataset.csv
Header: "customer_id","customer_unique_id","customer_zip_code_prefix","customer_city","customer_state"
Line count: 99442
```

## Error Handling

If no file path is provided, the application prints:

```text
Please provide a CSV file path.
```

If the file path does not exist, the application prints:

```text
File not found: <path>
```

## Notes

This is the first version of the C# ETL helper.

The current goal is to practice basic command-line input, file existence checks, and reading CSV file metadata.

Later versions may include more advanced CSV parsing and support for importing files with complex text fields, such as order reviews.