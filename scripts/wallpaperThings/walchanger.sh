#!/bin/bash
killall xwinwrap
killall wal
killall feh
sleep 0.3
feh --bg-scale ~/Pictures/wallpapers/black/black.jpg
# Check if a file was provided as an argument

# Extract the file extension
favo="/home/ibrahim/Pictures/wallpapers/favo"
first_file=$(ls -1t "$favo"  | head -1)
a="$favo/$first_file"
filename=$(basename -- "$a")
extension="${filename##*.}"


# Check if the file extension is png or jpg
if [ "$extension" == "png" ] || [ "$extension" == "jpg" ]; then
    # Use wal to set the wallpaper
    wal -i "$a"
elif [ "$extension" == "mp4" ]; then
    # Use xwinwrap and mpv to set the wallpaper
    feh --bg-color black
    wal -i "$a"
    nohup xwinwrap -g 1920x1080+0+0 -ni -ov -- mpv --loop-file=inf --speed=0.8 --no-keepaspect -wid WID "$1" >/dev/null 2>&1 & disown
elif [ "$extension" == "gif" ]; then
    # Convert the gif to mp4 using ffmpeg
    ffmpeg -i "$a" -pix_fmt yuv420p -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" "$direname/${filename%.*}.mp4"
    # Use xwinwrap and mpv to set the wallpaper
    nohup xwinwrap -g 1920x1080+0+0 -ni -ov -- mpv --loop-file=inf --speed=0.5 --no-keepaspect -wid WID "$direname/${filename%.*}.mp4" >/dev/null 2>&1 &disown
else
    echo "Unsupported file format: $extension"
    exit 1
fi
