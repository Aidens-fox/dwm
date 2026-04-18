#!/bin/bash
#作者Aidens-fox
#2026-04-11
#版本:1.2
echo "set Software mirror site(tuna)"
sudo bash  -c 'echo "Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch" > /etc/pacman.d/mirrorlist'
echo "set archCN"
sudo bash -c 'echo -e "\n[archlinuxcn]\nServer = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf'
sudo pacman -Syyu
echo "install yay,archlinuxcn-keyring"
sudo pacman -S archlinuxcn-keyring
sudo pacman -S  yay base-devel git
echo "install xorg"
sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot xorg-xset xsel xorg-xkill libx11 libxft libxinerama xwallpaper
echo "install Font"
sudo pacman -S ttf-sarasa-gothic noto-fonts-emoji noto-fonts-cjk ttf-jetbrains-mono-nerd
echo "install yazi emacs nvim"
sudo pacman -S  neovim mpv yazi ueberzugpp emacs 
sudo pacman -S yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide resvg imagemagick
echo "install zsh"
sudo pacman -S zsh-completions zsh
chsh -s /usr/bin/zsh
echo "cp dwm"
mkdir  -p  $HOME/.config
cp  -r dwm $HOME/.config/
echo "install dwm"
cd $HOME/.config/dwm
sudo make clean install
echo "cp dmenu"
cd $HOME/dwm
cp -r dmenu $HOME/.config/
cd $HOME/.config/dmenu
sudo make clean install
echo "cp st"
cd $HOME/dwm
cp -r st $HOME/.config/
cd $HOME/.config/st
sudo make clean install
cd $HOME/dwm
echo "cp nvim "
cd $HOME/dwm
cp -r nvim $HOME/.config/
echo "cp wallpaper"
cp -r 壁纸 $HOME/
echo "cp emacs"
cp -r emacs $HOME/.config/
echo "cp yazi"
cp -r yazi $HOME/.config/
echo "cp .xinitrc"
cp -r .xinitrc $HOME/
chmod +x $HOME/.xinitrc
echo "cp .zshrc"
cp -r .zshrc $HOME/
echo "install fcitx5"
yay -S fcitx5-im fcitx5-input-support fcitx5-chinese-addons fcitx5-pinyin-zhwiki
sudo bash  -c 'echo "GTK_IM_MODULE=fcitx" >> /etc/environment'
sudo bash  -c 'echo "QT_IM_MODULE=fcitx" >> /etc/environment'
sudo bash  -c 'echo "XMODIFIERS=@im=fcitx" >> /etc/environment'
sudo bash  -c 'echo "SDL_IM_MODULE=fcitx" >> /etc/environment'
sudo bash  -c 'echo "GLFW_IM_MODULE=ibus" >> /etc/environment'
echo "set zh_CN"
sudo bash -c 'echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen'
sudo locale-gen


