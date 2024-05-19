#!/usr/bin/env bash
killall -q polybar
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar menu 2>&1 | tee -a /tmp/polybar1.log & disown
polybar ip 2>&1 | tee -a /tmp/polybar1.log & disown
polybar tunnel 2>&1 | tee -a /tmp/polybar1.log & disown
polybar workspaces 2>&1 | tee -a /tmp/polybar1.log & disown
polybar target 2>&1 | tee -a /tmp/polybar1.log & disown
polybar date 2>&1 | tee -a /tmp/polybar1.log & disown
polybar sound 2>&1 | tee -a /tmp/polybar1.log & disown
polybar power 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
