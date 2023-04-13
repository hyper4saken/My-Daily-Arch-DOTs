#!/bin/bash

# Get the current date and time
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Set the output file name with the timestamp
output_file="/home/hyper4saken/Videos/recording_$timestamp.mp4"

# Set the screen size and frame rate
screen_size="1920x1080"
frame_rate="30"

# Start recording the screen using ffmpeg
ffmpeg -f x11grab -s "$screen_size" -r "$frame_rate" -i :0.0+0,0 -vcodec libx264rgb -crf 0 -preset ultrafast "$output_file"

