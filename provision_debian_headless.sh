#!/bin/bash
set -e

# update packages
apt-get update
apt-get upgrade -V -y

# install custom packages (git should already be installed)
apt-get install -V -y \
    ack-grep \
    build-essential \
    curl \
    htop \
    python \
    tree \
    vim \
    ;

# run updates
sh provision_common.sh
