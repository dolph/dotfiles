#!/bin/sh

# update packages
sudo pkg update
sudo pkg upgrade -y

# install custom packages (git should already be installed)
sudo pkg install -y \
    curl \
    htop \
    tree \
    vim \
    ;

# run updates
sh provision_common.sh
