#!/bin/bash
#作者Aidens-fox
#更新时间:2026-09-25
#版本:1.5
echo "install fcitx5"
sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-pinyin-zhwiki
sudo bash  -c 'echo "GTK_IM_MODULE=fcitx" >> /etc/environment'
sudo bash  -c 'echo "QT_IM_MODULE=fcitx" >> /etc/environment'
sudo bash  -c 'echo "XMODIFIERS=@im=fcitx" >> /etc/environment'
sudo bash  -c 'echo "SDL_IM_MODULE=fcitx" >> /etc/environment'
sudo bash  -c 'echo "GLFW_IM_MODULE=ibus" >> /etc/environment'
echo "set zh_CN"
sudo bash -c 'echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen'
sudo locale-gen
sudo modprobe snd-pcm-oss
echo 'snd-pcm-oss' | sudo tee /etc/modules-load.d/snd-pcm-oss.conf
