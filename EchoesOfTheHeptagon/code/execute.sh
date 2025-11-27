#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
PATTERN_FILE="$ROOT_DIR/src/echoes/pattern.csv"

A=$(tail -n +2 "$PATTERN_FILE" | head -n 1 | cut -d',' -f2)
B=$(tail -n +2 "$PATTERN_FILE" | head -n 2 | tail -n 1 | cut -d',' -f2)
C=$(tail -n +2 "$PATTERN_FILE" | head -n 3 | tail -n 1 | cut -d',' -f2)
D=$(tail -n +2 "$PATTERN_FILE" | head -n 4 | tail -n 1 | cut -d',' -f2)

TOTAL_MS=$((A + B + C + D + C + B + A))

TOTAL_SEC=$(awk "BEGIN {printf \"%.3f\", $TOTAL_MS / 1000}")

echo "PALINDROME_DURATION:$TOTAL_SEC"

