#!/bin/bash

installCommon ()
{
    message "Common"
    sudo apt install \
        curl \
        htop \
        git \
        ruby-full \
        tree \
        vim \
        zsh \
        mysql-client \
        nmap \
        -y
}

message ()
{
    echo -e "\n\n####################################"
    echo -e "$1"
    echo -e "####################################\n"
}

installUlancher ()
{
    if ! grep -q "agornostal/ulauncher" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
        message "Adding Ulancher PPA"
        sudo add-apt-repository ppa:agornostal/ulauncher -y
        sudo apt update
    fi

    message "Installing Ulancher"
    sudo apt install ulauncher wmctrl -y
}

installFlatpak ()
{
    message "Installing Flatpak"
    sudo apt install flatpak gnome-software-plugin-flatpak -y
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

installFlatpakSoftware ()
{
    message "Installing Flatpak Software"
    flatpak install \
        com.google.Chrome \
        com.brave.Browser \
        com.authy.Authy \
        us.zoom.Zoom \
        com.microsoft.Teams \
        com.slack.Slack \
        com.getpostman.Postman \
        rest.insomnia.Insomnia \
        com.visualstudio.code \
	    com.jetbrains.PhpStorm \
        org.getoutline.OutlineClient \
        -y

    message "Give Flatpak Apps Host Access"
    sudo flatpak override com.visualstudio.code --filesystem=host
    sudo flatpak override com.jetbrains.PhpStorm --filesystem=host
    sudo flatpak override rest.insomnia.Insomnia --filesystem=host
}

installAppImageSupport ()
{
    message "Installing App Image Support"
    sudo apt install libfuse2 -y
}

installGnomeThings ()
{
    message "Installing Gnome Extensions"
    sudo apt install \
        gnome-tweaks \
        gnome-sushi \
        gnome-shell-extension-manager \
        -y
}

improveBatteryPerformance ()
{
    message "Installing Battery Performance"
    sudo apt install tlp tlp-rdw -y
    sudo systemct1 enable tlp
}

cleanUp () {
    message "Remove unused"
    sudo apt remove \
        thunderbird \
        aisleriot \
        cheese \
        gnome-mahjongg \
        gnome-mines \
        gnome-sudoku \
        -y
    sudo apt autoremove -y
}

updateAndUpgrade ()
{
    sudo apt update
    sudo apt upgrade -y
    if command -v flatpak &> /dev/null; then
        message "Updating flatpaks"
        flatpak update
    fi
}

updateAndUpgrade
installCommon
installUlancher
installFlatpak
installFlatpakSoftware
installAppImageSupport
installGnomeThings
improveBatteryPerformance
cleanUp
