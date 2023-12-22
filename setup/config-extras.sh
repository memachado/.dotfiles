#!/usr/bin/bash

echo "Do you want to install ubuntu-restricted-extras? [y/N]:"
read -r extras

if [[ $extras =~ ^[Yy]$ ]]; then
    sudo apt install ubuntu-restricted-extras -y
fi


echo "Do you want to change the wallpaper? [y/N]:"
read -r wallpaper

if [[ $wallpaper =~ ^[Yy]$ ]]; then
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/Pictures/Wallpapers/wallpaper-01.jpg"
fi

echo "Do you want to change the terminal settings? [y/N]:"
read -r terminal

if [[ $terminal =~ ^[Yy]$ ]]; then
    cat ./gnome-terminal.properties | dconf load /org/gnome/terminal/
fi

echo "Do you want to disable graphical mode? [y/N]:"
read -r graphmode

if [[ $graphmode =~ ^[Yy]$ ]]; then

    sudo systemctl isolate multi-user.target

fi

echo "Do you want to generate a new ssh key? [y/N]:"
read -r sshkey

if [[ $sshkey =~ ^[Yy]$ ]]; then

    echo "Please enter your email address:"
    read -r email

    ssh-keygen -t ed25519 -C "$email" -q -f ~/.ssh/id_ed25519 -N ""

fi

echo "Do you want to configure git global config? [y/N]:"
read -r gitid

if [[ $gitid =~ ^[Yy]$ ]]; then

    echo "Please enter your email address for global config:"
    read -r gitemail

    echo "Please enter your name:"
    read -r name

    git config --global user.email "$gitemail"
    git config --global user.name "$name"
fi

function add_remote_debugging_port() {
    file="$1"

    if [ -f "$file" ]; then
        sed -i '/^Exec=/ {/ --remote-debugging-port=9222/! s/$/ --remote-debugging-port=9222/}' "$file"
        echo "Remote debugging port added to the lines starting with 'Exec=' in $file"
    else
        echo "$file not found!"
    fi
}

echo "Do you want to configure chrome debugging? [y/N]:"
read -r debugging

if [[ $debugging =~ ^[Yy]$ ]]; then

    add_remote_debugging_port

fi
