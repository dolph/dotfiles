#!/bin/bash
set -ex

# Find the active desktop
DESKTOP=(`wmctrl -d | grep "*"`)
DESKTOP_DIMENSIONS=`wmctrl -d | grep "*" | cut -d " " -f 12`
DESKTOP_WIDTH=`echo $DESKTOP_DIMENSIONS | cut -d "x" -f 1`
DESKTOP_HEIGHT=`echo $DESKTOP_DIMENSIONS | cut -d "x" -f 2`
HOSTNAME=`hostname`

THIRD_WIDTH=$(expr $DESKTOP_WIDTH / 3)
TWO_THIRD_WIDTH=$(expr 2 \* $DESKTOP_WIDTH / 3)

HALF_HEIGHT=$(expr $DESKTOP_HEIGHT / 2)

WINDOWS=`wmctrl -l`

if [[ $WINDOWS =~ "Netflix" ]] || [[ $WINDOWS =~ "YouTube" ]] || [[ $WINDOWS =~ "VLC media player" ]]; then
    MEDIA_PLAYER=true
else
    MEDIA_PLAYER=false
fi
if [[ $WINDOWS =~ "Mozilla Firefox" ]]; then
    FIREFOX=true
else
    FIREFOX=false
fi
if [[ $WINDOWS =~ "Zoom Meeting ID" ]]; then
    VIDEO_CONFERENCE=true
else
    VIDEO_CONFERENCE=false
fi

TITLE_BAR_HEIGHT=26

# List active windows on active destop
while read -r window; do
    window_id=`echo $window | cut -d " " -f 1`
    desktop_id=`echo $window | cut -d " " -f 2`
    current_x=`echo $window | cut -d " " -f 3`
    current_y=`echo $window | cut -d " " -f 4`
    current_width=`echo $window | cut -d " " -f 5`
    current_height=`echo $window | cut -d " " -f 6`
    window_title=`echo $window | cut -d " " -f 8-`

    # Left
    if [[ $window_title =~ "VLC media player" ]]; then
        if $FIREFOX; then
            # Go top left
            wmctrl -i -r $window_id -e 0,0,0,$THIRD_WIDTH,$(expr $HALF_HEIGHT - $TITLE_BAR_HEIGHT)
        else
            # Go left column
            wmctrl -i -r $window_id -e 0,0,0,$THIRD_WIDTH,$DESKTOP_HEIGHT
        fi
    fi
    if [[ $window_title =~ "Netflix" ]] || [[ $window_title =~ "YouTube" ]]; then
        # Go left column
        wmctrl -i -r $window_id -e 0,0,0,$THIRD_WIDTH,$DESKTOP_HEIGHT
    fi
    if [[ $window_title =~ "Mozilla Firefox" ]]; then
        if $MEDIA_PLAYER; then
            # Go bottom left
            wmctrl -i -r $window_id -e 0,0,$(expr $HALF_HEIGHT + 1),$THIRD_WIDTH,$(expr $HALF_HEIGHT - $TITLE_BAR_HEIGHT)
        else
            # Go left column
            wmctrl -i -r $window_id -e 0,0,0,$THIRD_WIDTH,$(expr $DESKTOP_HEIGHT - $TITLE_BAR_HEIGHT)
        fi
    fi
    if [[ $window_title =~ "Slack - " ]]; then
        if $MEDIA_PLAYER; then
            # Go bottom left
            wmctrl -i -r $window_id -e 0,0,$(expr $HALF_HEIGHT + 1),$THIRD_WIDTH,$(expr $HALF_HEIGHT - $TITLE_BAR_HEIGHT)
        else
            # Go left column
            wmctrl -i -r $window_id -e 0,0,0,$THIRD_WIDTH,$(expr $DESKTOP_HEIGHT - $TITLE_BAR_HEIGHT)
        fi
    fi

    # Middle
    if [[ $window_title =~ "Terminal" ]]; then
        if $VIDEO_CONFERENCE; then
            wmctrl -i -r $window_id -e 0,$(expr $THIRD_WIDTH + 1),$(expr $DESKTOP_HEIGHT / 2),$THIRD_WIDTH,$(expr $DESKTOP_HEIGHT / 2 - 14)
        else
            wmctrl -i -r $window_id -e 0,$(expr $THIRD_WIDTH + 1),0,$THIRD_WIDTH,$(expr $DESKTOP_HEIGHT - 14)
        fi
    fi
    if [[ $window_title =~ "Zoom Meeting ID" ]]; then
        wmctrl -i -r $window_id -e 0,$(expr $THIRD_WIDTH + 1),0,$THIRD_WIDTH,$(expr $DESKTOP_HEIGHT / 2 - $TITLE_BAR_HEIGHT)
    fi
    # Right
    if [[ $window_title =~ "Chrome" ]]; then
        wmctrl -i -r $window_id -e 0,$TWO_THIRD_WIDTH,0,$THIRD_WIDTH,$DESKTOP_HEIGHT
    fi
done <<< `wmctrl -G -l`

# Change the state of the window.
# wmctrl -r <WIN> -b <STARG>

# Resize and move the window around the desktop.
# wmctrl -r <WIN> -e <G>,<X>,<Y>,<W>,<H>
