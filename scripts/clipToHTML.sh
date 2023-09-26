#!/bin/bash

# Define the path
file_path=~/Documents/files/webfiles
template_path=/home/ibrahim/Templates/h-temp.html

# Clear the webfiles folder
rm -rf "$file_path"/*
mkdir -p "$file_path"

# Capture selected text using xsel
selected_text=$(xsel -o)

# Split selected text into paragraphs (adjust the chunk size if needed)

# Convert selected text to Markdown with headings
markdown_text=$selected_text

# Create the .md file with selected and formatted text
file_name=$(date +%Y%m%d%H%M%S).md
echo -e "$markdown_text" > "$file_path/$file_name"

# Compile .md to HTML using the default template
html_name=${file_name%.md}.html
pandoc "$file_path/$file_name" -o "$file_path/$html_name"

# Replace placeholder in template with compiled HTML
compiled_html=$(cat "$file_path/$html_name")
awk -v content="$compiled_html" '{gsub("__CONTENT__", content)}1' "$template_path" > "$file_path/template_modified.html"

# Open HTML in a browser
xdg-open "$file_path/template_modified.html"
