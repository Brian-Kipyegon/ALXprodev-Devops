#!/bin/bash

POKEMON_LIST=("bulbasaur" "ivysaur" "venusaur" "charmander" "charmeleon")
DATA_DIR="pokemon_data"
mkdir -p "$DATA_DIR"

for name in "${POKEMON_LIST[@]}"; do
    echo "Fetching data for $name..."
    success=false

    for attempt in {1..3}; do
        response=$(curl -s -w "%{http_code}" -o "$DATA_DIR/${name}.json" "https://pokeapi.co/api/v2/pokemon/$name")
        code="${response: -3}"

        if [ "$code" == "200" ]; then
            echo "Saved data to $DATA_DIR/${name}.json ✅"
            success=true
            break
        else
            echo "Attempt $attempt failed for $name (HTTP $code)"
            sleep 2
        fi
    done

    if ! $success; then
        echo "[$(date)] Failed to fetch $name after 3 attempts." >> errors.txt
        rm -f "$DATA_DIR/${name}.json"
    fi
done
