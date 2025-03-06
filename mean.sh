#!/bin/bash


# Ensure correct usage
if [[ $# -lt 1 || $# -gt 2 ]]; then
    echo "Usage: $0 <column> [file.csv]" >&2
    exit 1
fi

column=$1
file=${2:-/dev/stdin} 


# Ensure column number is valid
if ! [[ "$column" =~ ^[0-9]+$ ]]; then
    echo "Error: Column number not valid." >&2
    exit 1
fi


# Extract column, remove quotes, skip header, and calculate mean
# Skip the first line (header)|Extract the desired column|Remove ""|Remove space
tail -n +2 "$file" | cut -d ',' -f "$column" | tr -d '"' | tr -d ' ' | { 
    sum=0
    count=0
    while read value; do
        if [[ "$value" =~ ^[0-9]+(\.[0-9]*)?$ ]]; then  # Ensure numeric values
            sum=$(echo "$sum + $value" | bc)
            count=$((count + 1))
        fi
    done
    if [[ $count -gt 0 ]]; then
        echo "scale=2; $sum / $count" | bc
    else
        echo "Error: No numeric data found in column $column" >&2
        exit 1
    fi
}

