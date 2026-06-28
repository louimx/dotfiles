#!/bin/bash

if [ -z "$1" ] 
then
    echo "No monitor to shutdown provided. Run xrandr to see all connected monitors"
    exit 1
fi

xrandr | rg -w $1
if [ $? -eq 1 ] 
then
    echo "No monitor found with that name, run xrandr and try again."
    exit 1
fi


xrandr --output $1 --off

