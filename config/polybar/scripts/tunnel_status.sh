#!/bin/sh
STATUS=$(ifconfig | grep tun0 | awk '{print $1}' | tr -d ':')

if [ "$STATUS" = "tun0" ]; then
  echo "$(ifconfig | grep "inet " | awk '{print $2}')"
else
  echo "Disconnected"
fi
