#!/bin/bash

# Check if argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

N=$1

# Validate that N is a positive integer
if ! [[ "$N" =~ ^[0-9]+$ ]] || [ "$N" -le 0 ]; then
    echo "Error: Please provide a positive integer"
    exit 1
fi

# Weave the pattern
for ((i=1; i<=N; i++)); do
    for ((j=1; j<=i; j++)); do
        if [ $j -eq 1 ]; then
            echo -n "*"
        else
            echo -n " *"
        fi
    done
    echo ""
done
