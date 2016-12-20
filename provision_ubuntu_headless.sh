#!/bin/bash
set -e

if [[ $UID != 0 ]]; then
    echo "root or sudo required."
    exit 1
fi

# Skip installation questions.
export DEBIAN_FRONTEND=noninteractive

# Update packages.
apt update
apt install -y --no-install-recommends apt-utils
apt upgrade -V -y

# Install custom packages (git should already be installed).
# google-chrome-stable \
apt install -V -y \
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
apt autoremove -y || apt-get autoremove -y
apt clean || apt-get clean
apt autoclean || apt-get autoclean

# Run updates.
sh provision_common.sh
