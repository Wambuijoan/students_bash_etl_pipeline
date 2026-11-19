#!/usr/bin/env bash
set -eou pipefail

# Define the file paths
RAW_FILE="data/raw/students.csv"
OUT_FILE="data/processed/data_engineering.csv"
LOG_FILE="logs/pipeline.log"

# Ensure output and log directories exist
mkdir -p data/processed logs

# Run awk, filter the data, write to file, and capture the count
COUNT=$(awk -F',' -v out_file="$OUT_FILE" '
BEGIN {OFS=","}
NR == 1 {
    # Print the header of the new file
    print "student_id", "name", "course", "age" > out_file
    next
}
tolower($3) == "data engineering" {
    # Print the matching records and increase the counter
    print $1, $2, $3, $4 >> out_file
    count++
}
END {
    # Send final count to standard output
    print count
}
' "$RAW_FILE")

# Output results to the screen
echo "Total Data Engineering students found: $COUNT"

# Record execution date and time in the log file
echo "$(date '+%Y-%m-%d %H:%M:%S') - Executed data engineering pipeline. Extracted $COUNT records." >> "$LOG_FILE"

echo "Data saved to $OUT_FILE and logged to $LOG_FILE."
