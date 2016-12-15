#!/bin/bash
set -e

sudo ls || apt install sudo -V -y

# Update packages.
sudo apt update
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
