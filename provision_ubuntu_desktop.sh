#!/bin/bash
set -ex

# Update packages.
sudo apt-get update

# Install custom packages (git should already be installed).
sudo apt-get install -V -y \
    autossh \
    build-essential \
    curl \
    htop \
    python3 \
    python3-virtualenv \
    ruby \
    sshpass \
    tmux \
    tree \
    vagrant \
    vim \
    virtualbox \
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

gem install --user-install gist

# XFCE4
if [ -f "/etc/default/motd-news" ]; then
    sed "/^ENABLED=/s/=.*/=0/" /etc/default/motd-news > /tmp/motd-news
    mv /tmp/motd-news /etc/default/motd-news
fi

# Install hub
curl -fsSL --output /tmp/hub.tgz https://github.com/github/hub/releases/download/v2.11.2/hub-linux-amd64-2.11.2.tgz
tar -xzvf /tmp/hub.tgz
prefix=$HOME bash /tmp/hub/$(ls /tmp/hub)install
rm -rf /tmp/hub /tmp/hub.tgz

# Run updates.
sh provision_common.sh
