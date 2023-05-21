#!/bin/bash

dir="$HOME/.config/rofi/theme"

#Options
suspend="󰤄 Suspend"
logout="󰍃 Logout"
shutdown=" Shutdown"
lock=" Lock"
reboot=" Reboot"
windows="󰖳 Reboot to windows"
yes=""
no=""

#Use -s to preselect an item
select="none"
while getopts s: flag; do
	case "${flag}" in
	s) select=${OPTARG} ;;
	esac
done

case "${select}" in
suspend)
	select=${suspend}
	;;
logout)
	select=${logout}
	;;
shutdown)
	select=${shutdown}
	;;
lock)
	select=${lock}
	;;
reboot)
	select=${reboot}
	;;
windows)
	select=${windows}
	;;
esac

rofi_cmd() {
	rofi -dmenu \
		-i \
		-select ${select} \
		-p "Power option:" \
		-theme $dir/theme.rasi
}

run_rofi() {
	echo -e "$suspend\n$logout\n$lock\n$shutdown\n$reboot\n$windows" | rofi_cmd
}

chosen="$(run_rofi)"
case $chosen in
$suspend)
	systemctl suspend
	;;
$logout)
	i3-msg exit
	;;
$shutdown)
	systemctl poweroff
	;;
$lock)
	i3lock
	;;
$reboot)
	systemctl reboot
	;;
$windows)
	sudo grub2-set-default 4
	systemctl reboot
	;;
esac
