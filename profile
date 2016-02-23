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

# Switch bash to vi mode, because the bash default is unholy.
set -o vi

# Use color by default
export CLICOLOR=1

# Detect platform ($OSTYPE is not populated in FreeBSD 11)
platform=`uname`

if [[ "$platform" == 'Linux' || "$platform" == 'Darwin' ]]; then
    export GOPATH=$HOME/go
    export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/ruby/bin:$GOPATH/bin:$PATH

    # This doesn't need to be enabled every time, but why not.
    git config --global color.ui true
    git config --global user.email "dolph.mathews@gmail.com"
    git config --global user.name "Dolph Mathews"
    git config --global core.excludesfile $HOME/.gitignore_global

    # default: PS1='\h:\W \u\$'
    # hostname cwd $
    PS1="\[$(tput setaf 2)\]\h \[$(tput setaf 4)\]\W \[$(tput setaf 10)\]$ \[$(tput sgr0)\]"

    # keystone dev defaults
    export OS_IDENTITY_API_VERSION=3
    export OS_TOKEN=ADMIN
    export OS_URL=http://localhost:35357/v3

    # virtualenv shortcuts
    export WORKON_HOME=$HOME/venv
    source ~/dotfiles/virtualenvwrapperlite/virtualenvwrapperlite.sh
elif [[ "$platform" == 'FreeBSD' ]]; then
    # Do nothing
    echo 'FreeBSD'
fi
