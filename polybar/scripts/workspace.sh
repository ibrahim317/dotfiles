#!/bin/bash

# Define your custom labels
declare -A labels
labels[1]="FireFox"
labels[2]="terminal"
labels[3]="code"

# Output labels based on workspace index
i3-msg -t get_workspaces | jq -r '.[] | select(.focused == true) | .num' | while read -r workspace; do
  echo -n "${labels[$workspace]:-$workspace}"
done
