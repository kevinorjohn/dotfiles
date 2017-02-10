#!/bin/bash

# color format setting
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
PURPLE=$(tput setaf 5)
LBLUE=$(tput setaf 6)

# path
REPOPATH="`dirname $0`/src"

SET_FILE() {
	# Check whether the file exists or not
	if [ -f ~/$1 ]; then
		echo "${YELLOW}Warning: $1 exists in ${HOME}${NORMAL}"
		echo -n "To keep file and rename $1?[Y/n]: "
		read opt
		if [ "$opt" == "N" ] || [ "$opt" == "n" ]; then
			rm -i ~/$1
		else
			mv ~/$1 ~/$1.old
		fi
	fi
	echo "Setting up $1..."
	cp $REPOPATH/$1 ~/$1
	if [ ! $? -eq "0" ]; then
		echo "${RED}ERROR: Cannot set up $1${NORMAL}"
	fi
}


INSTALL() {
	for file in $(ls -a $1/.[a-zA-Z0-9]*)
	do
		if [ -f $file ]; then
			SET_FILE $(basename $file)
		fi
	done
}

# install basic plugins
INSTALL $REPOPATH

if [ "$1" == "--advanced" ]; then
	# install advanced version with YouCompleteMe plugin
	INSTALL "${REPOPATH}/advanced"
fi

# Setup vundle and install vim plugins
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
vim +PluginInstall +qall

echo "${GREEN}Installation is complete${NORMAL}"
