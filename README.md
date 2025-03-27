# Henk's Dotfiles

This is the home of all my dotfiles. These are files that add custom configurations to my computer and applications, primarily the terminal.

## How to install

My dotfiles are managed by [GNU Stow](https://www.gnu.org/software/stow/).

### Mac
1. Install [homebrew](https://brew.sh/)
2. Install [GNU Stow](https://www.gnu.org/software/stow/) (`brew install stow`)
3. Clone this repository
4. Run stow command

```sh
stow . -t ~
```

### Linux
1. run
```sh
sudo apt update && sudo apt upgrade && sudo apt install build-essential procps curl file git
```
2. Install [homebrew](https://brew.sh/)
3. After homebrew install add the brew environment to your shell (it's in the comment that is prompted after install)
4. Clone this repository
5. run

```sh
brew bundle
```
6. Run stow command

```sh
stow . -t ~
```
7. Depending on the distro we need to make zsh our shell. Run
```sh
echo "/home/linuxbrew/.linuxbrew/bin/zsh" | sudo tee -a /etc/shells
chsh -s /home/linuxbrew/.linuxbrew/bin/zsh
```

