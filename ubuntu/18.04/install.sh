#!/bin/bash

#-----remove------
sudo apt purge firefox
sudo rm -rf ~/.mozilla
sudo apt-get remove --purge libreoffice*
sudo apt purge thunderbird* remmina* gnome-todo gnome-calendar cheese gnome-mahjongg gnome-sushi gnome-sudoku gnome-taquin gnome-tetravex gnome-robots gnome-chess gnome-mines aisleriot mahjongg ace-of-penguins gnomine gbrainy lightsoff swell-foop quadrapassel

#-----package------
sudo apt-get -y install git snapd synaptic

#-----browser------
sudo apt-get -y install chromium-browser

#-----media-----------
sudo apt-get -y install rhythmbox totem
#eog

sudo apt update
sudo apt upgrade
sudo apt autoremove

#-----install-themes--
sudo apt-get -y install gnome-shell-extensions gnome-shell-extension-dash-to-panel
sudo apt-get -y install arc-theme
sudo add-apt-repository -u -y ppa:snwh/ppa
sudo apt-get -y install paper-icon-theme

#-----make&build------
sudo apt-get -y install build-essential

#-----languages-------
sudo apt-get -y install python3-pip

sudo add-apt-repository -y ppa:vala-team
sudo apt-get -y install software-properties-common
sudo apt-get -y update
sudo apt-get -y install valac

#-----libraries-------
sudo apt-get -y install libglfw3 libglfw3-dev
sudo apt-get -y install libgtk-3-dev libappindicator3-dev libgee-0.8* sqlite3 libsqlite3-dev sqlitebrowser curl
#sudo pip3 install numpy vispy p5 mutagen

#-----settings--------
sudo apt-get -y install gnome-tweaks gnome-tweak-tool gconf-editor
#chrome-gnome-shell

#-----visualcode-------
#sudo snap install code --classic

#-----VSCodium---------
#wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
#echo 'deb https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/repos/debs/ vscodium main' | sudo tee --append /etc/apt/sources.list.d/vscodium.list
#sudo apt-get -y update
#sudo apt-get -y install codium

#-----musescore-------
#sudo snap install musescore
#sudo snap connect musescore:cups-control
#sudo snap connect musescore:network-manager
#sudo snap connect musescore:alsa
#sudo snap connect musescore:removable-media

#-----downloaders-----
#sudo apt-get -y install transmission uget

#-----skype------------
#sudo snap install skype --classic
