#!/bin/bash

# Create the main directory "five"
mkdir -p five

# Loop to create subdirectories dir1 through dir5
for i in {1..5}; do
  subdir="five/dir$i"
  mkdir -p "$subdir"

  # For each subdirectory, create file1 through file4
  for j in {1..4}; do
    # Create each file with j lines, each containing the digit j
    for k in $(seq 1 $j); do
      echo "$j"
    done > "$subdir/file$j"
  done
done
