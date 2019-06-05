#!/bin/bash

# this script will symlink all important files that need to be symlinked
ln -s $HOME/.dotfiles/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/.dotfiles/snippets $HOME/.config/nvim/snippets

# symlink fish stuff
ln -s $HOME/.dotfiles/config.fish $HOME/.config/fish/config.fish

