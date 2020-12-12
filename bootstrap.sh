#!/bin/bash
set -e
sudo dnf -y install git python-virtualenv
mkdir -p $HOME/venv
virtualenv $HOME/venv/ansible
source $HOME/venv/ansible/bin/activate
git clone https://github.com/dolph/dotfiles.git $HOME/dotfiles
pip install -r $HOME/dotfiles/requirements.txt
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
