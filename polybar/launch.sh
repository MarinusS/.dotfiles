#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1
for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar --reload bar1 &
done
