echo $1
source /home/ibrahim/Documents/myScripts/wallpaperThings/movtofavo.sh $1
favo="/home/ibrahim/Pictures/wallpapers/favo/"
first_file=$(ls -1t "$favo"  | head -1)
source /home/ibrahim/Documents/myScripts/wallpaperThings/walchanger.sh "$favo/$first_file"
