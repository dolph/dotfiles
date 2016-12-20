#!/bin/bash
set -e

if [[ $UID != 0 ]]; then
    echo "root or sudo required."
    exit 1
fi

# Skip installation questions.
export DEBIAN_FRONTEND=noninteractive

# Update packages.
apt-get update
apt-get install -y --no-install-recommends apt-utils
apt-get upgrade -V -y

# Install custom packages (git should already be installed).
# google-chrome-stable \
apt-get install -V -y \
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
apt-get autoremove -y
apt-get clean
apt-get autoclean

# Run updates.
source ./provision_common.sh
