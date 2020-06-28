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

# Convert value to decimal like 0.1,0.3...
LEVEL=$1
brightness_level="$(( $LEVEL / 100 )).$(( $LEVEL % 100 ))"

# Limitation
if(( $LEVEL <= 0 || $LEVEL > 100 ))
then
   echo "Brightness limit exceed, choose from 1 to 100"
   exit 0;
fi

# Find the Monitor Name
monitor=$(xrandr | grep " connected" | cut -f1 -d " ")

# Now adjust Brightness

xrandr --output $monitor --brightness $brightness_level;

echo "Adjusted to $LEVEL"
