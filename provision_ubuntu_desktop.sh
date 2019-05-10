#!/bin/bash
set -ex

# Update packages.
sudo apt-get update

# Install custom packages (git should already be installed).
sudo apt-get install -V -y \
    build-essential \
    curl \
    htop \
    python \
    tmux \
    tree \
    vim \
    vlc \
    ;

sudo apt-get remove -y --purge \
    libreoffice* \
    audacity \
    thunderbird \
    empathy \
    rhythmbox \
    ;
sudo apt-get autoremove -y
sudo apt-get clean
sudo apt-get autoclean

# XFCE4
if [ -f "/etc/default/motd-news" ]; then
    sed "/^ENABLED=/s/=.*/=0/" /etc/default/motd-news > /tmp/motd-news
    mv /tmp/motd-news /etc/default/motd-news
fi

# Run updates.
sh provision_common.sh
