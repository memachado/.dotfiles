#!/usr/bin/bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak update -y

function install_group () {
    group_name="$1"
    group_packages=("${@:2}")

    echo "Do you want to install the $group_name group?"
        for package in "${group_packages[@]}"; do
            echo "- $package"
        done
    echo -n "[y/N]:"
    read -r answer

    if [ "$answer" = "y" ]; then
        for package in "${group_packages[@]}"; do
            flatpak install $package -y
        done
    fi
}

echo "Do you want to use the unsnap script before installing flatpaks? [y/N]:"
read -r unsnap

if [[ $unsnap =~ ^[Yy]$ ]]; then
    echo "Installing unsnap ..."
    cd ~
    git clone https://github.com/popey/unsnap
    cd unsnap
    ./unsnap auto
fi

install_group "games" \
    com.heroicgameslauncher.hgl \
    net.lutris.Lutris

install_group "security" \
    org.keepassxc.KeePassXC

install_group "office" \
    org.onlyoffice.desktopeditors \
    org.qownnotes.QOwnNotes

install_group "media" \
    com.spotify.Client \
    org.gimp.GIMP \

install_group "work" \
    io.dbeaver.DBeaverCommunity \
    com.getpostman.Postman

install_group "extras" \
    org.gtk.Gtk3theme.Pop-dark