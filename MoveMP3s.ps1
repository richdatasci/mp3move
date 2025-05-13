#!/bin/bash

# Bash script to move all MP3 files from subfolders to a folder on desktop

# Set the source directory (where your subfolders with MP3s are)
source_dir="/path/to/your/folder/with/subfolders"

# Set the destination directory (on your desktop)
destination_dir="$HOME/Desktop/All_MP3s"

# Create the destination folder if it doesn't exist
mkdir -p "$destination_dir"

# Find and move all MP3 files
find "$source_dir" -type f -name "*.mp3" | while read -r file; do
    filename=$(basename "$file")
    
    # Handle duplicate filenames
    dest_path="$destination_dir/$filename"
    counter=1
    while [ -e "$dest_path" ]; do
        base="${filename%.*}"
        ext="${filename##*.}"
        dest_path="$destination_dir/${base}_${counter}.${ext}"
        ((counter++))
    done
    
    mv "$file" "$dest_path"
done

echo "Moved $(find "$destination_dir" -type f -name "*.mp3" | wc -l) MP3 files to $destination_dir"
