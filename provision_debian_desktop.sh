#!/bin/bash
set -e

# install custom fonts
cp ~/dotfiles/fonts/* /usr/local/share/fonts
chmod -R 777 /usr/local/share/fonts

# reload font cache
fc-cache -fv

# setup apt sources
cp ~/dotfiles/debian/desktop/etc/apt/sources.list /etc/apt/sources.list
chmod 0644 /etc/apt/sources.list

# update packages
apt-get update
apt-get upgrade -V -y

# install custom packages (git should already be installed)
apt-get install -V -y \
    google-chrome-stable \
    ;

# run updates
sh provision_common.sh
