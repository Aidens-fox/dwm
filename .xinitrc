while true; do
bat_s=$(< /sys/class/power_supply/BAT0/status)
bat=$(< /sys/class/power_supply/BAT0/capacity)
time=$(date +"󱑂 %Y-%m-%d-(0%u) %H:%M:%S")
audio=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1 )

if [ "$(cat /sys/class/net/wlp0s20f3/operstate)" = "up" ]; then
    net_icon="*" 
else
    net_icon="-" 
fi
net_str="[$net_icon]"
[ "$bat_s" = "Discharging" ] && bat_icon=" " || bat_icon=""

xsetroot -name "[$net_icon][ $audio%][$bat_icon$bat%][$time]"
   sleep 1s
done &
export XCURSOR_THEME="Moga-Neon-Sandy"
export XCURSOR_SIZE=24
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
export _JAVA_AWT_WM_NONREPARENTING=1 
exec fcitx5  & 
xwallpaper --zoom 壁纸/pacman.png &
xset s off -dpms &
/usr/bin/lxpolkit & 
exec dwm
