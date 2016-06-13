#!/bin/bash
set -e

# Install custom fonts.
sudo cp ~/dotfiles/fonts/* /usr/local/share/fonts
sudo chmod -R 777 /usr/local/share/fonts

# Reload font cache.
fc-cache -fv

# Update packages.
sudo apt-get update
sudo apt-get upgrade -V -y

# Install custom packages (git should already be installed).
sudo apt-get install -V -y \
    gconf-cli \
    google-chrome-stable \
    xchat \
    pithos \
    ;

sudo apt-get remove -y --purge \
    libreoffice* \
    audacity \
    firefox \
    thunderbird \
    empathy \
    rhythmbox \
    ;
sudo apt-get autoremove -y
sudo apt-get clean
sudo apt-get autoclean

# Set terminal to Solarized Black color scheme.
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/palette '#000000000000:#DCDC32322F2F:#858599990000:#B5B589890000:#26268B8BD2D2:#D3D336368282:#2A2AA1A19898:#EEEEE8E8D5D5:#00002B2B3636:#CBCB4B4B1616:#58586E6E7575:#65657B7B8383:#838394949696:#6C6C7171C4C4:#9393A1A1A1A1:#FDFDF6F6E3E3'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/bold_color '#9393a1a1a1a1'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/background_color '#000000000000'
gconftool-2 -s -t string /apps/gnome-terminal/profiles/Default/foreground_color '#838394949696'
gconftool-2 -s -t bool /apps/gnome-terminal/profiles/Default/use_theme_colors false
gconftool-2 -s -t bool /apps/gnome-terminal/profiles/Default/bold_color_same_as_fg false

# Run updates.
sh provision_common.sh
