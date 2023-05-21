#!/bin/bash

dir="$HOME/.config/rofi/theme"

current_mode=$(supergfxctl -g)
supported=$(supergfxctl -s | sed 's/\[//' | sed 's/\]//' | sed 's/, /\n/')

choose_mode() {
	echo -e "$supported" | rofi -dmenu \
		-i \
		-p "Switch to:" \
		-theme $dir/theme.rasi
}

confirm_logout() {
	echo -e "Logout\nLater\n" | rofi -dmenu \
		-i \
		-p "Graphics mode changed, logout needed. Logout now ?" \
		-theme $dir/theme.rasi
}

chosen="$(choose_mode)"
if [[ -n ${chosen} ]]; then
	chosen=$(echo $chosen | tr '[:upper:]' '[:lower:]')
	#echo "Current: $current_mode"
	#echo "Chosen: $chosen"
	if [[ ! $chosen = $current_mode ]]; then
		supergfxctl -m ${chosen}

		logout_now="$(confirm_logout)"
		if [[ ${logout_now} = "Logout" ]]; then
			i3-msg exit
		fi
	fi
fi
