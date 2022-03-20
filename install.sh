#!/bin/bash

FORCE=''

while getopts 'f' flag; do
	case "${flag}" in 
		f) FORCE="true" && echo "Force set. Forcing the issues" ;;
	esac
done

if [ ! command -v brew &> /dev/null ] || [[ "$FORCE"=="true" ]] ; then
	echo "brew is not installed. installing..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ ! command -v fish &> /dev/null ] || [ "$FORCE"="true" ] ; then
	echo "fish is not installed. installing and setting as default..."
	brew install fish
	echo /usr/bin/fish | sudo tee -a /etc/shells
	chsh -s /usr/bin/fish

	echo "installing fisher..."
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

	echo "installing tide"
	fisher install ilancosman/tide
fi

if [ ! command -v nvim &> /dev/null ] || [ "$FORCE"="true" ] ; then
	echo "neovim is not installed. installing..."
	brew install neovim
fi

if [ ! command -v rg &> /dev/null ] || [ "$FORCE"="true" ] ; then
	echo "ripgrep is not installed. installing..."
	brew install ripgrep
fi
