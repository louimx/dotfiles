#!/bin/bash
shopt -s nocasematch
current=$(pactl get-default-source)

if [ "$1" = "--next" ]; then
  mapfile -t srcs < <(pactl list short sources | awk '{print $2}' | grep -v -e '\.monitor$' -e Mic2)
  next=${srcs[0]}
  for i in "${!srcs[@]}"; do
    [[ "${srcs[$i]}" == "$current" ]] && next=${srcs[$(( (i+1) % ${#srcs[@]} ))]}
  done
  pactl set-default-source "$next"
  for s in $(pactl list short source-outputs | cut -f1); do
    pactl move-source-output "$s" "$next"
  done
  current=$next
fi

case $current in
  *usb*) echo "󰍬 RØDE" ;;
  *)     echo "󰍬 Laptop" ;;
esac
