#!/bin/bash

# Script: brtns
# Version: 1.0

# if no paramater passed, throw error
if [ -z $@ ]
then
  echo "Please, add number from 0.1 to 1";
  echo "Example:  brtns 0.8"
  exit 0;
fi


# Find the Monitor Name
monitor=$(xrandr | grep " connected" | cut -f1 -d " ")

# Now adjust Brightness

xrandr --output $monitor --brightness $1;

echo "Adjusted"
