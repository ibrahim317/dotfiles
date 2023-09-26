alacritty -t alacritty-floating &
sleep 0.1s # Wait for the window to appear
i3-msg "[title=alacritty-floating]" floating enable
