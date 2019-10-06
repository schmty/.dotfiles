#!/bin/bash

# this script will symlink all important files that need to be symlinked
ln -s $HOME/.dotfiles/init.vim $HOME/.config/nvim/init.vim
ln -s $HOME/.dotfiles/coc-settings.json $HOME/.config/nvim/coc-settings.json

# symlink fish stuff
ln -s $HOME/.dotfiles/config.fish $HOME/.config/fish/config.fish

# symlink zsh stuff
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/antigen.zsh $HOME/antigen.zsh

# chunkwm stuff
ln -s $HOME/.dotfiles/.chunkwmrc $HOME/.chunkwmrc
ln -s $HOME/.dotfiles/.skhdrc $HOME/.skhdrc
