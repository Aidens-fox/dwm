#!/bin/zsh

light=$(brightnessctl -m | cut -d, -f4)
bat_s=$(< /sys/class/power_supply/BAT0/status)
bat=$(< /sys/class/power_supply/BAT0/capacity)
time=$(date +"󱑂 %Y-%m-%d-(0%u) %H:%M:%S")
audio_raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

if [[ "$audio_raw" == *"[MUTED]"* || "$audio_raw" == *"[NO]"* ]]; then
    audio="MUTED"
else
    audio=$(echo "$audio_raw" | awk '{print ($2 * 100)"%"}')
fi

if [[ "$(< /sys/class/net/wlp0s20f3/operstate)" == "up" ]]; then
    net_icon="*" 
else
    net_icon="-" 
fi

if ss -tln | grep  :7897; then
    proxy_str="+"  
else
    proxy_str="-"       
fi

if [[ "$bat_s" == "Discharging" ]]; then
    bat_icon=" "
else
    bat_icon=" "
fi

xsetroot -name "[$proxy_str][$net_icon][ $audio][󰌵$light][$bat_icon$bat%][$time]"
