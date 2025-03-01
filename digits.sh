#!/bin/bash

sum = 0

for num in {1000..2000}; do
    if [[ $num =~ ^[01]+$ ]]; then
	sum = $((sum + sum))
    fi
done

echo "The sum is $sum"
