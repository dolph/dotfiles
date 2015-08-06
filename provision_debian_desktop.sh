#!/bin/bash

# symlink dotfiles
sh ~/dotfiles/symlink.sh

# install custom fonts
sudo cp ~/dotfiles/fonts/* /usr/local/share/fonts
sudo chmod -R 777 /usr/local/share/fonts

# reload font cache
fc-cache -fv

# setup apt sources
sudo cp ~/dotfiles/debian/desktop/etc/apt/sources.list /etc/apt/sources.list
sudo chmod 0644 /etc/apt/sources.list

# update packages
sudo apt-get update
sudo apt-get upgrade -V -y

# install custom packages (git should already be installed)
sudo apt-get install -V -y \
    ack-grep \
    google-chrome-stable \
    tree \
    vim \
    xchat \
    ;

# run updates
sh provision_common.sh
