#!/usr/bin/bash


echo "Installing stow ..."

sudo apt install stow -y

echo "Create symlinks ..."

cd $HOME/.dotfiles

stow .

cd $HOME/.fonts

fc-cache -f -v

gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/.wallpapers/wallpaper-01.jpg"