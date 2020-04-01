#!/bin/bash

#-----remove------
sudo apt-get purge firefox
sudo rm -rf ~/.mozilla
sudo apt-get remove --purge libreoffice*
sudo apt-get purge thunderbird* remmina* gnome-todo gnome-calendar cheese gnome-mahjongg gnome-sushi gnome-sudoku gnome-taquin gnome-tetravex gnome-robots gnome-chess gnome-mines aisleriot mahjongg ace-of-penguins gnomine gbrainy lightsoff swell-foop quadrapassel

#-----package------
sudo apt install git snapd synaptic

#-----browser------
sudo apt install chromium-browser

#-----media-----------
sudo apt install rhythmbox
#rhythmbox-plugins totem eog

sudo apt update
sudo apt upgrade
sudo apt-get clean
sudo apt-get autoremove

#-----install-themes--
sudo apt install gnome-shell-extensions gnome-shell-extension-dash-to-panel
sudo apt install arc-theme
sudo add-apt-repository -u ppa:snwh/ppa
sudo apt install paper-icon-theme

#-----musescore-------
sudo snap install musescore
sudo snap connect musescore:cups-control
sudo snap connect musescore:network-manager
sudo snap connect musescore:alsa
sudo snap connect musescore:removable-media

#-----visualcode-------
#sudo snap install code --classic

#-----VSCodium---------
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium

#-----make&build------
sudo apt install build-essential

#-----languages-------
sudo apt install python3-pip

sudo add-apt-repository ppa:vala-team
sudo apt-get install software-properties-common
sudo apt-get update
sudo apt-get install valac

#-----libraries-------
sudo apt install libglfw3 libglfw3-dev
sudo apt install libgtk-3-dev libappindicator3-dev libgee-0.8* sqlite3 libsqlite3-dev sqlitebrowser curl
#sudo pip3 install numpy vispy p5 mutagen

#-----settings--------
sudo apt install gnome-tweaks gnome-tweak-tool gconf-editor
#chrome-gnome-shell

#-----downloaders-----
#sudo apt install transmission uget

#-----skype------------
#sudo snap install skype --classic


