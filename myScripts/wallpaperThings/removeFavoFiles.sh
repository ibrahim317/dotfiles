cd /home/ibrahim/Pictures/wallpapers/favo
last_modified_file=$(ls -1t | head -n1)
find . ! -name "$last_modified_file" -type f -delete
