#!/bin/bash

# path
PATH="`pwd`/`dirname $0`/src"

# color format setting
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
PURPLE=$(tput setaf 5)
LBLUE=$(tput setaf 6)

function SET_FILE {
	if [ -f ~/$1 ]; then
		echo "${YELLOW}Warning: $1 exists in ${HOME}${NORMAL}"
		mv ~/$1 ~/$1.old 
	fi
	echo "Setting up $1"
	cp $PATH/$1 ~/$1
	if [ $? -eq "0" ]; then
		echo "${RED}ERROR: Cannot set up $1${NORMAL}"
	fi
}


function INSTALL {
	for $file in $1/*
	do
		if [ -f $file]; then
			SET_FILE $(basename $file)
		fi
	done
}

INSTALL $PATH
if [ ! -z "$1" ]; then
	# install another version with YouCompleteMe
	INSTALL "$PATH/all"
fi

if $SHELL == "bash"

# Setup vundle and install vim plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "${GREEN}Installation is complete${NORMAL}"
source ~/.bashrc
