#!/bin/bash
set -e
mkdir -p --mode=0700 ~/.ssh
install --mode 0600 /dev/null ~/.ssh/authorized_keys
curl -fsSL https://github.com/dolph.keys >> ~/.ssh/authorized_keys
sudo dnf -y install git python-virtualenv
mkdir -p $HOME/venv
virtualenv $HOME/venv/ansible
source $HOME/venv/ansible/bin/activate
[ -d $HOME/dotfiles ] || git clone https://github.com/dolph/dotfiles.git $HOME/dotfiles
pip install --upgrade --upgrade-strategy=eager -r $HOME/dotfiles/requirements.txt
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.general
ansible-galaxy install dolph.ansible_ussher_role --force
