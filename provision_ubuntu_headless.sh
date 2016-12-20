#!/bin/bash
set -e

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

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
source $SCRIPTPATH/provision_common.sh
