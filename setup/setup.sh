#!/usr/bin/bash


echo "Installing stow ..."

sudo apt install stow -y

echo "Create symlinks ..."

cd $HOME/.dotfiles

stow .

cd $HOME/.fonts

fc-cache -f -v

gsettings set org.gnome.desktop.background picture-uri-dark 'file:///home/miguel/Pictures/Wallpapers/galaxy-wallpaper-36.jpg'