#!/bin/bash

[ ! -d "$HOME/.config/nvim" ] && mkdir $HOME/.config/nvim && echo "Creating nvim configuration folder"

cp init.vim $HOME/.config/nvim/init.vim
cp .gitconfig $HOME/.gitconfig

