while true; do
    $HOME/look.sh
   sleep 1s
done &
dbus-update-activation-environment --systemd DISPLAY
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=dwm
fcitx5 -d & 
#slstatus &
xwallpaper --zoom 壁纸/g.png
/usr/bin/lxpolkit &

export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
xset s off -dpms 
exec dwm
