#!/bin/bash

DATA_DIR="pokemon_data"
OUTPUT="pokemon_report.csv"

echo "Name,Height (m),Weight (kg)" > "$OUTPUT"

for file in "$DATA_DIR"/*.json; do
    name=$(jq -r '.name' "$file" | sed 's/.*/\u&/')
    height=$(jq '.height' "$file" | awk '{printf "%.2f", $1 / 10}')
    weight=$(jq '.weight' "$file" | awk '{printf "%.2f", $1 / 10}')
    echo "$name,$height,$weight" >> "$OUTPUT"
done

awk -F, 'NR>1 {h+=$2; w+=$3; n++} END {
  printf "\nAverage Height: %.2f m\nAverage Weight: %.2f kg\n", h/n, w/n
}' "$OUTPUT"
