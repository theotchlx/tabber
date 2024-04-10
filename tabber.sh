#!/bin/bash

# Check if a file path is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

file_path=$1

# Check if the 'firefox' command is available
if ! command -v firefox &> /dev/null; then
    echo "Error: 'firefox' command not found. Make sure Firefox is installed."
    exit 1
fi

# Read each line from the file and start 'firefox' with the line as an argument
while IFS= read -r line; do
    firefox "$line" &
	sleep 0.1
done < "$file_path"

echo "Firefox instances started with URLs from the file."

