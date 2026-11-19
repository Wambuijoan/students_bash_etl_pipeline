# Student Data Pipeline

A bash script to extract, transform, and load student data.

## Requirements
* Extracts data from `data/raw/students.csv`.
* Filters for "Data Engineering" (case-insensitive).
* Saves to `data/processed/data_engineering.csv`.
* Logs the execution time to `logs/pipeline.log`.

## How to Run
```bash
chmod 755 student_pipeline.sh
./student_pipeline.sh
