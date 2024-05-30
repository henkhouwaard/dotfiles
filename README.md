# Henk's Dotfiles

This is the home of all my dotfiles. These are files that add custom configurations to my computer and applications, primarily the terminal.

## How to install

My dotfiles are managed by [GNU Stow](https://www.gnu.org/software/stow/).

1. Install [homebrew](https://brew.sh/)
2. Install [GNU Stow](https://www.gnu.org/software/stow/) (`brew install stow`)
3. Clone this repository
4. Run stow command

```sh
stow . -t ~
```
