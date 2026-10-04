export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

dbus-update-activation-environment --systemd DISPLAY
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=dwm
/usr/bin/lxpolkit &
xrdb -merge ~/.Xresources
export _JAVA_AWT_WM_NONREPARENTING=1

while true; do
time=$(date +"󱑂 %Y-%m-%d-(0%u) %H:%M:%S")
audio_raw=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

if [[ "$audio_raw" == *"[MUTED]"* || "$audio_raw" == *"[NO]"* ]]; then
    audio="MUTED"
else
    audio=$(echo "$audio_raw" | awk '{print ($2 * 100)"%"}')
fi

if [[ "$(< /sys/class/net/wlp0s20f0u4/operstate)" == "up" ]]; then
    net_icon="*" 
else
    net_icon="-" 
fi

if ss -tln | grep  :7897; then #改成自己的代理端口
    proxy_str="+"  
else
    proxy_str="-"       
fi

xsetroot -name "[$proxy_str][$net_icon][ $audio][$time] "
   sleep 1s
done &

fcitx5 -d & 
nm-applet &
dunst &
clipmenud &
xwallpaper --zoom 壁纸/gruvbox_pacman.png
#xrandr --output HDMI-0 --mode 1920x1080 --rate 100
xset s off -dpms 
exec dwm
