#!/bin/bash

[ ! -d "$HOME/.config/nvim" ] && mkdir $HOME/.config/nvim && echo "Creating nvim configuration folder"

cp init.vim $HOME/.config/nvim/init.vim && echo "Copied neovim settings"
cp .gitconfig $HOME/.gitconfig && echo "Copied git config settings"
cp config.fish $HOME/.config/fish/ && echo "Copied fish config settings"
