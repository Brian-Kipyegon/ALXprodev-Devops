#!/bin/bash

# Extract and format data using jq, awk, sed
name=$(jq -r '.name' data.json | sed 's/.*/\u&/') # capitalize
height=$(jq '.height' data.json | awk '{print $1 / 10}') # decimeters to meters
weight=$(jq '.weight' data.json | awk '{print $1 / 10}') # hectograms to kg
type=$(jq -r '.types[0].type.name' data.json | sed 's/.*/\u&/') # capitalize

echo "$name is of type $type, weighs ${weight}kg, and is ${height}m tall."
