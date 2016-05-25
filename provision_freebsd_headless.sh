#!/bin/sh
set -e

# Update packages.
sudo pkg update
sudo pkg upgrade -y

# Install custom packages (git should already be installed).
sudo pkg install -y \
    bash \
    curl \
    htop \
    tree \
    vim-lite \
    ;

# Change the shell to bash.
sudo chsh -s /usr/local/bin/bash

# Run updates.
sh provision_common.sh
