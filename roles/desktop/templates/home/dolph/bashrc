#!/bin/bash

# Priorities.
export EDITOR=vim

# I edit a lot of text files, okay? Think of all the carpel tunnel syndrome
# I've avoided.
alias e="vim"
alias q="exit"

alias gist="gist-paste"

# pyc files are annoying
export PYTHONDONTWRITEBYTECODE=1

# Make it trivial to jump into a development server and automatically create or
# rejoin a tmux session. This will disconnect other tmux sessions
# automatically, making it seamless to switch between multiple client devices.
# When you detach from tmux, ssh quits as well.
alias dev="ssh -p 443 dev.dolphm.com -t 'tmux att -d || tmux new'"

# default: PS1='\h:\W \u\$'
# hostname cwd $
export PS1="[\[\033[36m\]\t\[\033[39m\]] \[\033[32m\]\u\[\033[39m\]@\[\033[34m\]\h\[\033[39m\]:\[\033[33m\]\w\n\[\033[33m\]\\$ \[\033[40m\]\[$(tput sgr0)\]\[\033[39m\]"
# cwd $
# export PS1="\[\033[32m\]\W \[\033[34m\]\\$ \[\033[34m\]\[$(tput sgr0)\]\[\033[96m\]"

# Enable color file listings.
alias ls='ls --almost-all --classify --color=auto'

# Set virtualenv shortcuts.
export WORKON_HOME=$HOME/venv
. ~/dotfiles/virtualenvwrapperlite/virtualenvwrapperlite.sh

# If ack-grep is installed...
if hash ack-grep 2>/dev/null; then
    # But ack is not a thing...
    if ! hash ack 2>/dev/null; then
        # Then set an alias for ack.
        alias ack=ack-grep
    fi
fi

function ssh-unlock() {
    if [ -n "$TMUX" ]; then
        if [ -z ${SSH_AGENT_PID+x} ] || [ ! "ps -p ${SSH_AGENT_PID} > /dev/null" ]; then
            eval "$(ssh-agent -s)" > /dev/null
            ssh-add $HOME/.ssh/id_rsa
        fi
    fi
}
ssh-unlock
