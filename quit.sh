#!/usr/bin/env sh

echo "$@" | xargs -n 1 -I § -P 2 sh -c "/usr/bin/osascript -e 'tell application \"§\" to quit'" &
sleep 10
echo "$@" | xargs -n 1 -I § -P 2 killall -9 §