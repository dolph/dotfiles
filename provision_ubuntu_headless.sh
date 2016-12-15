#!/bin/bash
set -e

cat /etc/apt/sources.list
sed -e 's/http:/https:/' /etc/apt/sources.list > /etc/apt/sources.list.tmp && mv /etc/apt/sources.list.tmp /etc/apt/sources.list
cat /etc/apt/sources.list

# Update packages.
sudo apt update || apt update && apt install sudo -V -y
sudo apt upgrade -V -y

# Install custom packages (git should already be installed).
# google-chrome-stable \
sudo apt install -V -y \
    build-essential \
    curl \
    htop \
    keychain \
    python-minimal \
    tmux \
    tree \
    vim \
    ;

# The alternative approaches provide support for Ubuntu 14.04
sudo apt autoremove -y || sudo apt-get autoremove -y
sudo apt clean || sudo apt-get clean
sudo apt autoclean || sudo apt-get autoclean

# Run updates.
sh provision_common.sh
