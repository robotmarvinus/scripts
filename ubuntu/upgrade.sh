#!/bin/bash

#remove
sudo apt-get purge firefox
sudo rm -rf ~/.mozilla
sudo apt-get remove --purge libreoffice*
sudo apt-get purge thunderbird* remmina* gnome-todo gnome-calendar cheese gnome-mahjongg gnome-sushi gnome-sudoku gnome-taquin gnome-tetravex gnome-robots gnome-chess gnome-mines aisleriot mahjongg ace-of-penguins gnomine gbrainy lightsoff swell-foop quadrapassel

#-----clear-dirs--------------
rm -rf /usr/share/gnome-shell/extensions/*
rm -rf /usr/local/share/gnome-shell/extensions/*
rm -rf ~/.local/share/gnome-shell/extensions/*
rm -rf /etc/skel/*

#-----drivers--------- 
#Центр приложений - Правка - Источники приложений - Другое ПО - Партнеры Canonical
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo ubuntu-drivers autoinstall

#-----packages--------
sudo apt install git snapd

#-----browser---------
sudo apt install chromium-browser

#-----media-----------
sudo apt install rhythmbox rhythmbox-plugins totem eog

#-----downloaders-----
sudo apt install transmission uget

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

#-----skype------------
sudo snap install skype --classic

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

sudo pip3 install numpy vispy p5 mutagen

sudo apt update
sudo apt upgrade
sudo apt-get clean
sudo apt-get autoremove

#-----settings--------
sudo apt install gnome-tweaks gnome-tweak-tool chrome-gnome-shell gconf-editor

#-----install-themes--
sudo apt install gnome-shell-extensions gnome-shell-extension-dash-to-panel
sudo apt install arc-theme
sudo add-apt-repository -u ppa:snwh/ppa
sudo apt install paper-icon-theme

#-----set-default-values------
#cat <<EOF | sudo tee /path

sudo mkdir -p /etc/dconf/profile

sudo bash -c 'cat > /etc/dconf/profile/user' << EOF
user-db:user
system-db:local
EOF

sudo mkdir -p /etc/dconf/db/local.d

sudo bash -c 'cat > /etc/dconf/db/local.d/00-preferences' << EOF
[org/gnome/shell]
enabled-extensions=['user-theme@gnome-shell-extensions.gcampax.github.com', 'dash-to-panel@jderose9.github.com']

[org/gnome/desktop/interface]
gtk-theme="Arc"
icon-theme="Paper"

[org/gnome/shell/extensions/user-theme]
name="Arc"

[org/gnome/shell]
favorite-apps=['chromium-browser.desktop', 'gedit.desktop', 'gnome-terminal.desktop', 'nautilus.desktop']
enable-hot-corners=false

[org/gnome/desktop/input-sources]
xkb-options=['grp:alt_shift_toggle']

[org/gnome/nautilus/desktop]
home-icon-visible=false
network-icon-visible=false
volumes-visible=false
trash-icon-visible=false

[org/gnome/desktop/background]
show-desktop-icons=false

[org/gnome/terminal/legacy]
default-show-menubar=false

[org/gnome/terminal/legacy/keybindings]
close-tab="<Ctrl>q"
close-window="<Ctrl>w"
copy="<Ctrl>c"
find="<Ctrl>f"
new-tab="<Ctrl>t"
paste="<Ctrl>v"
reset-and-clear="<Ctrl><Shift>r"

[org/gnome/gedit/preferences/editor]
tabs-size=4
wrap-mode='none'

[org/gnome/rhythmbox]
size=(1500, 800)
statusbar-visible=false

[org/gnome/rhythmbox/library/source]
show-browser=true

[org/gnome/rhythmbox/sources]
browser-views='genres-artists-albums'
visible-columns=['post-time', 'artist', 'duration', 'genre', 'track-number', 'album', 'play-count', 'rating']

[org/gnome/rhythmbox/plugins]
active-plugins=['audiocd', 'android', 'power-manager', 'mmkeys', 'generic-player', 'iradio', 'rb', 'alternative-toolbar']

[org/gnome/rhythmbox/plugins/alternative_toolbar]
app-menu-display=false
show-source-toolbar=false
EOF

sudo dconf update

#-----user-settings-----------
gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com', 'dash-to-panel@jderose9.github.com']"
gsettings set org.gnome.desktop.interface gtk-theme 'Arc'
gsettings set org.gnome.desktop.interface icon-theme 'Paper'
gsettings set org.gnome.shell.extensions.user-theme name 'Arc'
gsettings set org.gnome.shell favorite-apps "['chromium-browser.desktop', 'skype_skypeforlinux.desktop', 'codium.desktop', 'musescore_musescore.desktop', 'rhythmbox.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.gedit.desktop', 'org.gnome.Nautilus.desktop']"
gsettings set org.gnome.shell enable-hot-corners false
gsettings set org.gnome.desktop.input-sources xkb-options "['grp:alt_shift_toggle']" #раскладка (gnome-tweaks -> Клавиатура и мышь -> Дополнительные настройки раскладки)

gsettings set org.gnome.nautilus.desktop home-icon-visible false
gsettings set org.gnome.nautilus.desktop network-icon-visible false
gsettings set org.gnome.nautilus.desktop trash-icon-visible false
gsettings set org.gnome.nautilus.desktop volumes-visible false
gsettings set org.gnome.desktop.background show-desktop-icons false

gsettings set org.gnome.shell enable-hot-corners false
gsettings set org.gnome.terminal.legacy default-show-menubar false

gsettings set org.gnome.terminal.legacy.keybindings close-tab "<Ctrl>q"
gsettings set org.gnome.terminal.legacy.keybindings close-window "<Ctrl>w"
gsettings set org.gnome.terminal.legacy.keybindings copy "<Ctrl>c"
gsettings set org.gnome.terminal.legacy.keybindings find "<Ctrl>f"
gsettings set org.gnome.terminal.legacy.keybindings new-tab "<Ctrl>t"
gsettings set org.gnome.terminal.legacy.keybindings paste "<Ctrl>v"
gsettings set org.gnome.terminal.legacy.keybindings reset-and-clear "<Ctrl><Shift>r"

gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor wrap-mode 'none'

gsettings set org.gnome.rhythmbox size (1500, 800)
gsettings set org.gnome.rhythmbox statusbar-visible false

gsettings set org.gnome.rhythmbox.library.source show-browser true

gsettings set org.gnome.rhythmbox.sources browser-views 'genres-artists-albums'
gsettings set org.gnome.rhythmbox.sources visible-columns "['post-time', 'artist', 'duration', 'genre', 'track-number', 'album', 'play-count', 'rating']"

gsettings set org.gnome.rhythmbox.plugins active-plugins ['audiocd', 'android', 'power-manager', 'mmkeys', 'generic-player', 'iradio', 'rb', 'alternative-toolbar']

gsettings set org.gnome.rhythmbox.plugins.alternative_toolbar app-menu-display false
gsettings set org.gnome.rhythmbox.plugins.alternative_toolbar show-source-toolbar false

#-----file-templates-default--
sudo mkdir -p /etc/skel/Шаблоны

sudo bash -c 'cat > /etc/skel/Шаблоны/скрипт\ bash.sh' << EOF
#!/bin/bash
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/скрипт\ python.py' << EOF
#!/usr/bin/env python3

if __name__ == "__main__":
    print("Hello")
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/скрипт\ javascript.js' << EOF
function main() {

}
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/файл\ css.css' << EOF
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/файл\ html.html' << EOF
<html>
	<head>
		<title>Html document</title>
		<style>
			body { margin: 0; }
		</style>
	</head>
	<body>

	</body>
</html>
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/файл\ vala.vala' << EOF
using Gtk;

public class Application : Gtk.Application {

	public Application() {
        Object(application_id: "org.domain.gnome_application");
	}

	protected override void activate() {
        var window   = new Gtk.ApplicationWindow(this);
        window.show_all();
	}

	public static int main(string[] args) {
		Application app = new Application();
		return app.run(args);
	}
}
EOF

sudo bash -c 'cat > /etc/skel/Шаблоны/файл\ txt.txt' << EOF
EOF

#-----file-templates-user-----
sudo mkdir -p ~/Шаблоны

cat > ~/Шаблоны/файл\ vala.vala << EOF
using Gtk;

public class Application : Gtk.Application {

	public Application() {
        Object(application_id: "org.domain.gnome_application");
	}

	protected override void activate() {
        var window   = new Gtk.ApplicationWindow(this);
        window.show_all();
	}

	public static int main(string[] args) {
		Application app = new Application();
		return app.run(args);
	}
}
EOF

cat > ~/Шаблоны/скрипт\ bash.sh <<EOF
#!/bin/bash
EOF

cat > ~/Шаблоны/скрипт\ python.py <<EOF
#!/usr/bin/env python3

if __name__ == "__main__":
    print("Hello")
EOF

cat > ~/Шаблоны/скрипт\ javascript.js << EOF
function main() {

}
EOF

cat > ~/Шаблоны/файл\ css.css << EOF
EOF

cat > ~/Шаблоны/файл\ html.html << EOF
<html>
	<head>
		<title>Html document</title>
		<style>
			body { margin: 0; }
		</style>
	</head>
	<body>

	</body>
</html>
EOF

cat > ~/Шаблоны/файл\ txt.txt << EOF
EOF
