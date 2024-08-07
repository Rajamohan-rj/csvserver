#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_index> <end_index>"
    exit 1
fi

# Assign arguments to variables
start_index=$1
end_index=$2

# Generate the output file name
output_file="inputFile"

# Remove the output file if it already exists
if [ -f "$output_file" ]; then
    rm "$output_file"
else
    touch "$output_file"
fi

# Loop through the range and generate entries
for (( i=$start_index; i<=$end_index; i++ )); do
    random_number=$(( RANDOM % 1000 + 1 ))
    echo "$i, $random_number" >> "$output_file"
done

echo "File '$output_file' generated successfully."
