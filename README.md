# dotfiles

Build a machine with software, dotfiles, etc, for productivity.

## Dependencies

* `git`
* `ansible`

## Usage

To deploy to `localhost`:

    git clone https://github.com/dolph/dotfiles.git
    cd dotfiles
    ansible-playbook --ask-become-pass headless.yml # or desktop.yml
