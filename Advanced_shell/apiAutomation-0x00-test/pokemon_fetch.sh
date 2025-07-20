#!/bin/bash

# Define output files
DATA_FILE="data.json"
ERROR_FILE="errors.txt"

# Make the API request
RESPONSE=$(curl -s -w "%{http_code}" -o "$DATA_FILE" https://pokeapi.co/api/v2/pokemon/pikachu)

# Extract status code (last 3 characters)
STATUS_CODE="${RESPONSE: -3}"

# Check for success (200 OK)
if [ "$STATUS_CODE" -ne 200 ]; then
  echo "[$(date)] Error fetching Pikachu data. HTTP Status: $STATUS_CODE" >> "$ERROR_FILE"
  rm -f "$DATA_FILE"  # Remove incomplete or empty file
fi
