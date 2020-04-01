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

[org/gnome/desktop/sound]
event-sounds=false

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
active-plugins=['alternative-toolbar']

[org/gnome/rhythmbox/plugins/alternative_toolbar]
app-menu-display=false
show-source-toolbar=false
EOF

sudo dconf update

#-----user-settings-----------
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'ru')]"
gsettings set org.gnome.shell enable-hot-corners false

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

gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab '<Ctrl>q'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-window '<Ctrl>w'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ copy '<Ctrl>c'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ paste '<Ctrl>v'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ find '<Ctrl>f'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab '<Ctrl>t'
gsettings set org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ reset-and-clear '<Ctrl><Shift>r'

gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.gedit.preferences.editor wrap-mode 'none'

gsettings set org.gnome.rhythmbox statusbar-visible false
gsettings set org.gnome.rhythmbox size "(1500, 800)"
gsettings set org.gnome.rhythmbox.sources browser-views 'genres-artists-albums'
gsettings set org.gnome.rhythmbox.sources visible-columns "['post-time', 'artist', 'duration', 'genre', 'track-number', 'album', 'play-count', 'rating']"
gsettings set org.gnome.rhythmbox.plugins.alternative_toolbar app-menu-display false
gsettings set org.gnome.rhythmbox.plugins.alternative_toolbar show-source-toolbar false
gsettings set org.gnome.rhythmbox.plugins active-plugins "['android', 'rb', 'alternative-toolbar', 'iradio', 'audiocd', 'generic-player', 'mmkeys', 'replaygain', 'power-manager']"
