#!/bin/bash
shopt -s nocasematch
current=$(pactl get-default-sink)

if [ "$1" = "--next" ]; then
  mapfile -t sinks < <(pactl list short sinks | awk '{print $2}' | grep -v HDMI)
  next=${sinks[0]}
  for i in "${!sinks[@]}"; do
    [[ "${sinks[$i]}" == "$current" ]] && next=${sinks[$(( (i+1) % ${#sinks[@]} ))]}
  done
  pactl set-default-sink "$next"
  for s in $(pactl list short sink-inputs | cut -f1); do
    pactl move-sink-input "$s" "$next"
  done
  current=$next
fi

case $current in
  *hdmi*)    echo "󰡁 HDMI" ;;
  *usb*)     echo "󰋋 RØDE" ;;
  *speaker*) echo "󰓃 Speakers" ;;
  *)         echo "󰓃 ?" ;;
esac
