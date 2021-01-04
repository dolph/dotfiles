#!/bin/bash
set -e
sudo dnf -y install git python-virtualenv
mkdir -p $HOME/venv
virtualenv $HOME/venv/ansible
source $HOME/venv/ansible/bin/activate
[ -d $HOME/dotfiles ] || git clone https://github.com/dolph/dotfiles.git $HOME/dotfiles
pip install --upgrade --upgrade-strategy=eager -r $HOME/dotfiles/requirements.txt
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
