#!/bin/bash

# Create the out directory if it doesn't exist
mkdir -p out

# Compile the C program from src/main.c into out/phantom
gcc src/main.c -o out/phantom

# Check if compilation was successful
if [ $? -eq 0 ]; then
    # On Windows, gcc may create phantom.exe, ensure phantom exists for cross-platform compatibility
    if [ -f out/phantom.exe ] && [ ! -f out/phantom ]; then
        # Try to create a hardlink (works on NTFS), fallback to copy if that fails
        ln out/phantom.exe out/phantom 2>/dev/null || cp out/phantom.exe out/phantom
    fi
    echo "Compilation successful! The phantom executable has been created in out/phantom"
else
    echo "Compilation failed!"
    exit 1
fi
