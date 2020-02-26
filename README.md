# dotfiles

Build a machine with software, dotfiles, etc, for productivity.

## Dependencies

* `git`
* `ansible`

## Usage

To deploy to `localhost`:

    curl https://raw.githubusercontent.com/dolph/dotfiles/master/bootstrap.sh | bash
    cd $HOME/dotfiles
    ansible-playbook --ask-become-pass headless.yml # or desktop.yml
