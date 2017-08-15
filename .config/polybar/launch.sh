#!/usr/bin/env sh

# Terminate already running bar instances
kilall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bars
MONITOR=DVI-I-3 polybar main &
MONITOR=DVI-I-2 polybar main &
