#!/bin/bash

POKEMON_LIST=("bulbasaur" "ivysaur" "venusaur" "charmander" "charmeleon")
DATA_DIR="pokemon_data"
mkdir -p "$DATA_DIR"

fetch_pokemon() {
    name=$1
    echo "Fetching data for $name..."
    response=$(curl -s -w "%{http_code}" -o "$DATA_DIR/${name}.json" "https://pokeapi.co/api/v2/pokemon/$name")
    code="${response: -3}"

    if [ "$code" == "200" ]; then
        echo "Saved data to $DATA_DIR/${name}.json ✅"
    else
        echo "[$(date)] Failed to fetch $name (HTTP $code)" >> errors.txt
        rm -f "$DATA_DIR/${name}.json"
    fi
}

for name in "${POKEMON_LIST[@]}"; do
    fetch_pokemon "$name" &
    sleep 1  # minimal stagger to reduce API spike
done

wait  # wait for all background processes to finish
echo "All fetch operations complete."
