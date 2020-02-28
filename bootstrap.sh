#!/bin/bash
sudo dnf -y install git python-virtualenv
mkdir $HOME/venv
virtualenv $HOME/venv/ansible
source $HOME/venv/ansible/bin/activate
git clone https://github.com/dolph/dotfiles.git $HOME/dotfiles
pip install -r $HOME/dotfiles/requirements.txt
