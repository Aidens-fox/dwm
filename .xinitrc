export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US
dbus-update-activation-environment --systemd DISPLAY
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=dwm
/usr/bin/lxpolkit &
xrdb -merge ~/.Xresources
export _JAVA_AWT_WM_NONREPARENTING=1
slstatus &
fcitx5 -d & 
nm-applet &
dunst &
clipmenud &
xwallpaper --zoom 壁纸/g.png
xset s off -dpms 
exec dwm
