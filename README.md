# dotfiles

Build a machine with software, dotfiles, etc, for productivity.

## Dependencies

* `git`
* `ansible`

## Usage

To deploy to `localhost`:

    curl https://raw.githubusercontent.com/dolph/dotfiles/master/bootstrap.sh | bash
    cd $HOME/dotfiles
    source ~/venv/ansible/bin/activate
    ansible-playbook --ask-become-pass headless.yml # or desktop.yml

## Desktop interface design: `i3` + `urvxt` + `tmux` + `vim`

### Motions

Each layer has a different modifier key to control motions, but the same motions
have the same effect at each layer.

* `i3` modifier: <kbd>Alt</kbd>
  * + <kbd>Tab</kbd> / <kbd>Shift</kbd> + <kbd>Tab</kbd>: switch workspaces
  * + <kbd>H</kbd> / <kbd>J</kbd> / <kbd>K</kbd> / <kbd>L</kbd>: switch containers
* `tmux` modifier: <kbd>Ctrl</kbd>
  * + <kbd>Tab</kbd> / <kbd>Shift</kbd> + <kbd>Tab</kbd>: switch windows
  * + <kbd>H</kbd> / <kbd>J</kbd> / <kbd>K</kbd> / <kbd>L</kbd>: switch panes
* `vim` modifier: <kbd>Ctrl</kbd>
  * + <kbd>H</kbd> / <kbd>J</kbd> / <kbd>K</kbd> / <kbd>L</kbd>: switch buffers

`tmux` and `vim` seamlessly share the same modifier key.

### Clipboard

Copying text at any one layer should make it available to paste at any other
layer in the stack.

* `i3`:
  * Copy: <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>C</kbd>
  * Paste <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>V</kbd>
* `urvxt`:
  * Copy: <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>C</kbd>
  * Paste <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>V</kbd>
* `tmux`:
  * Copy: <kbd>Ctrl</kbd> + <kbd>a</kbd>, <kbd>V</kbd>, make selection, <kbd>Y</kbd>
* `vim`:
  * Paste in insert mode: <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>V</kbd>
  * Paste in normal mode: `"+gP`
