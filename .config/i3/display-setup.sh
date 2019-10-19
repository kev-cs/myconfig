#!/bin/bash
# Notes : 
# - to run this script on lid open/close, modify /etc/acpi/handler.sh (or add an event handler)
# - to run this script on display connect/disctonnect, add this line to /etc/udev/rules.d/95-monitors.rules
#       ACTION=="change", RUN+="/path/to/script"

# udev runs as root, so we need to tell it how to connect to the X server:
export DISPLAY=:0
export XAUTHORITY=/home/kev/.Xauthority

send_notif() {
    sudo -u kev DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus" notify-send "$1"
    echo "$1"
    logger "$1"
}

apply_external_monitor_setup() {
    xrandr --output eDP1 --mode 1600x900 --pos 480x1080 --rotate normal --output DP1 --primary --auto --pos 0x0 --rotate normal --output DP2 --primary --auto --pos 0x0 --rotate normal --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
}

FORCE=$([[ "$1" == "force" ]] && echo true)
CONNECTED_MONITORS=($(xrandr | grep " connected" | awk '{ print$1 }'))
ACTIVE_DP_MONITORS=$(xrandr --listactivemonitors | grep " DP")
IS_EDP1_ON=$([[ ! -z $(xrandr --listactivemonitors | grep "eDP1" ) ]] && echo true || echo false)
IS_LID_CLOSED=$([[ "$(cat /proc/acpi/button/lid/LID0/state)" == *"closed" ]] && echo true || echo false)
IS_DISPLAY_MODIFIED=false

IS_EXTERNAL_MONITOR_CONNECTED=false
for monitor in "${CONNECTED_MONITORS[@]}"; do
    # DP only for now, no need hdmi
    [[ "$monitor" == "DP"* ]] && IS_EXTERNAL_MONITOR_CONNECTED=true && break;
done


send_notif "Running display config script"

if [[ "$IS_EXTERNAL_MONITOR_CONNECTED" == "true" ]]; then
    send_notif "External monitor connected"

    if [[ -z "$ACTIVE_DP_MONITORS" ]]; then
        send_notif "No external monitor configured, executing setup"
        apply_external_monitor_setup
        IS_DISPLAY_MODIFIED=true
    elif [[ "$FORCE" == "true" ]]; then
        send_notif "Forcing setup with external monitor"
        apply_external_monitor_setup
        IS_DISPLAY_MODIFIED=true
    else
        send_notif "External monitor already configured"
    fi

    if [[ "$IS_LID_CLOSED" == "true" ]] && [[ "$IS_EDP1_ON" == "true" ]] ; then
        send_notif "Lid is closed, turning off eDP1 output"
        xrandr --output eDP1 --off
        IS_DISPLAY_MODIFIED=true
    elif [[ "$IS_LID_CLOSED" == "false" ]] && [[ "$IS_EDP1_ON" == "false" ]]; then
        send_notif "Lid is opened with an external monitor but eDP1 is off, turning on eDP1 output"
        apply_external_monitor_setup
        IS_DISPLAY_MODIFIED=true
    fi
else
    send_notif "No external monitor connected"

    if [[ ! -z "$ACTIVE_DP_MONITORS" ]]; then
        send_notif "External monitor is configured, executing setup"
        xrandr --auto --output eDP1 --auto
        IS_DISPLAY_MODIFIED=true
    fi
fi

if [[ "$IS_DISPLAY_MODIFIED" == "true" ]]; then
    send_notif "Display has been modified, seting up wallpaper"
    sudo -u kev nitrogen --restore
    killall conky
    sudo -u kev conky -c /usr/share/conky/conky1.10_shortcuts_maia
    sudo -u kev conky -c /usr/share/conky/conky_maia
else
    send_notif "No modification applied to display"
fi
