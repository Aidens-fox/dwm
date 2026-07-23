export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
dbus-update-activation-environment --systemd DISPLAY
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=dwm
/usr/bin/lxpolkit &
xrdb -merge ~/.Xresources

while true; do
    $HOME/look.sh
   sleep 1s
done &
fcitx5 -d & 
nm-applet &
dunst &
batsignal -w 20 -c 15 -d 5 &
xwallpaper --zoom 壁纸/g.png
xset s off -dpms 
exec dwm
