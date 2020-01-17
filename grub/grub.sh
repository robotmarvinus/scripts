#!/bin/bash

#-----gdm3------------

#sudo mv /etc/gdm3/greeter.dconf-defaults /etc/gdm3/greeter_orig.dconf-defaults

#sudo bash -c 'cat > /etc/gdm3/greeter.dconf-defaults' << EOF
#[org/gnome/desktop/interface]
#gtk-theme='Arc'

#[org/gnome/desktop/background]
#picture-options='none'
#primary-color='#000000'
#EOF

#dpkg-reconfigure gdm3

sudo mv /usr/share/gnome-shell/theme/gdm3.css /usr/share/gnome-shell/theme/gdm3_.css
sudo cp /usr/share/gnome-shell/theme/gnome-classic.css /usr/share/gnome-shell/theme/gdm3.css


#-----wayland---------
#echo $XDG_SESSION_TYPE
#sudo gedit /etc/gdm3/custom.conf
#WaylandEnable=true


#-----grub2-----------
#resolution[640x480]
#sudo apt-get install v86d
#sudo nano /etc/default/grub
#GRUB_GFXMODE=1920x1080
#GRUB_GFXPAYLOAD_LINUX=keep

#echo FRAMEBUFFER=y | sudo tee /etc/initramfs-tools/conf.d/splash

#sudo update-initramfs -u
#sudo update-grub2
#theme


#---------------------
#настроить шрифты
#электропитание ноутбук отключить
