#!/bin/bash

# Priorities.
export EDITOR=vim

# I edit a lot of text files, okay? Think of all the carpel tunnel syndrome
# I've avoided.
alias e=vim

# Make it trivial to jump into a development server and automatically create or
# rejoin a tmux session. This will disconnect other tmux sessions
# automatically, making it seamless to switch between multiple client devices.
# When you detach from tmux, ssh quits as well.
alias dev="ssh -p 443 dev.dolphm.com -t 'tmux att -d || tmux new'"

# default: PS1='\h:\W \u\$'
# hostname cwd $
PS1="\[\033[32m\]\h \[\033[34m\]\W \[\033[40m\]$ \[\033[39m\]"

# Set virtualenv shortcuts.
export WORKON_HOME=$HOME/venv
. ~/dotfiles/virtualenvwrapperlite/virtualenvwrapperlite.sh
