#!/bin/bash

# Loop through all video files in current directory
for file in *.avi *.mp4 *.wmv *.mkv; do
  # Get the base filename without extension
  filename=$(basename "$file" | cut -f 1 -d '.')

  # Convert video to MKV format with new filename
  ffmpeg -i "$file" -vcodec libx265 -crf 28 "${filename}_converted.mkv"

  # Delete original file
  rm "$file"
done
