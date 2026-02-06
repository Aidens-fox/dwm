#/bin/sh
i3status | while :
do
    read line
    xsetroot -name "$line"
done &
xset s off -dpms & feh --bg-fill  壁纸/Arch-Linux.png &
exec  fcitx5 &  conky -c ~/.config/conky/desktop.conf &
exec dwm
