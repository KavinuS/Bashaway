#!/bin/bash

# Get the number from command line argument
num=$1

# Check if argument is provided
if [ -z "$num" ]; then
    echo "Neither"
    exit 0
fi

# Check if the number is an integer (basic validation)
if ! [[ "$num" =~ ^-?[0-9]+$ ]]; then
    echo "Neither"
    exit 0
fi

# Convert to integer (bash arithmetic)
num=$((num))

# Check for numbers <= 1 or negative numbers
if [ $num -le 1 ]; then
    echo "Neither"
    exit 0
fi

# Check if number is 2 (the only even prime)
if [ $num -eq 2 ]; then
    echo "Prime"
    exit 0
fi

# Check if number is even (and > 2, so composite)
if [ $((num % 2)) -eq 0 ]; then
    echo "Composite"
    exit 0
fi

# Check divisibility by odd numbers from 3 to sqrt(num)
i=3
while [ $((i * i)) -le $num ]; do
    if [ $((num % i)) -eq 0 ]; then
        echo "Composite"
        exit 0
    fi
    i=$((i + 2))
done

# If we get here, the number is prime
echo "Prime"
