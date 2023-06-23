# Launch Ranger and allow user to select a file
ranger $HOME/Pictures/wallpapers

# Get the file path of the selected file
selected_file="$RANGER_FILE"

# Check if the selected file exists
if [ -f "$selected_file" ]; then
    # Set the selected file as the wallpaper using feh
    feh --no-fehbg --bg-fill "$selected_file"
else
    # Display an error message if the selected file does not exist
    echo "Error: $selected_file does not exist."
fi