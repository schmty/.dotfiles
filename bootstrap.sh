#!/bin/bash

# this script will bootstrap and install all tools in my dev environment

# first up is installing xcodes command line tools
xcode-select --install

# then after this we will go ahead and install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# homebrew cask installs
brew cask install visual-studio-code google-chrome vimr postman alfred 1password dash flux iterm2 slack google-backup-and-sync docker

# homebrew env stuff installation
brew install node nvm pyenv pyenv-virtualenv watchman git fish hub

# after git is installed we must configure it
git config --global user.name "Jake Schmitz"
git config --global user.email jake.d.schmitz@gmail.com

# make sure to add fish shell to /etc/shells
echo '/usr/local/bin/fish' >> /etc/shells

chsh -s /usr/local/bin/fish

# install oh my fish stuff
curl -L https://get.oh-my.fish | fish

source ~/Google\ Drive/dotfiles/symlink.sh
omf install spacefish
omf install vi-mode

# start to setup neovim stuff like installing vim plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

