#!/bin/sh

# Find the line in "xrandr -q --verbose" output that contains current screen orientation and "strip" out current orientation.

rotation="$(xrandr -q --verbose | grep 'connected' | egrep -o  '\) (normal|left|inverted|right) \(' | egrep -o '(normal|left|inverted|right)')"

# Using current screen orientation proceed to rotate screen and input tools.

case "$rotation" in
    normal)
    # rotate to the left
    xrandr -o left
    xinput set-prop 'Atmel Atmel maXTouch Digitizer' 'Coordinate Transformation Matrix' 0 -1 1 1 0 0 0 0 1
    ;;
    left)
    # rotate to normal
    xrandr -o normal
    xinput set-prop 'Atmel Atmel maXTouch Digitizer' 'Coordinate Transformation Matrix' 1 0 0 0 1 0 0 0 1
    ;;
esac