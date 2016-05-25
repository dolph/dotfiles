#!/bin/bash
set -e

# update packages
sudo apt-get update
sudo apt-get upgrade -V -y

# install custom packages (git should already be installed)
sudo apt-get install -V -y \
    ack-grep \
    curl \
    htop \
    tree \
    vim \
    ;

# run updates
sh provision_common.sh
