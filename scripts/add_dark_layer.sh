#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 input_image.png"
  exit 1
fi

input_file=$1
opacity=55
size=$(identify -format "%wx%h" "$input_file")
gray_file="$HOME/Pictures/files/dark.png"

output_file="$(basename "${input_file%.*}_dark.png")"
output_dir=$(dirname "$input_file")
output_path="$output_dir/$output_file"

convert -size "$size" xc:"gray(0%,${opacity}%)" "$gray_file"
composite -blend ${opacity}% "$gray_file" "$input_file" "$output_path"
