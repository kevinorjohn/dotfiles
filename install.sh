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
SRCPATH="`dirname $0`/src"

SET_FILE() {
    FILE=".$1"
	# Check whether the file exists or not
	if [ -f ~/$FILE ]; then
		echo "${YELLOW}Warning: $FILE has already existed in ${HOME}${NORMAL}"
        echo -n "Delete [D], keep [K] or rename [R] $FILE to $FILE.old: "
		read opt
		if [ "$opt" == "D" ] || [ "$opt" == "d" ]; then
            echo "${RED}Deleting $FILE${NORMAL}"
			rm -vi ~/$FILE
        elif [ "$opt" == "K" ] || [ "$opt" == "k" ]; then
            echo "${GREEN}Keeping original file $FILE${NORMAL}"
            return
        elif [ "$opt" == "R" ] || [ "$opt" == "r" ]; then
            echo "${GREEN}Renaming $FILE to $FILE.old${NORMAL}"
            mv ~/$FILE ~/$FILE.old
        else
            echo "${RED}ERROR: option should be either [D/K/R]${NORMAL}"
            exit 1
		fi
	fi
	echo "Setting up $FILE..."
	cp $SRCPATH/$1 ~/$FILE
	if [ ! $? -eq "0" ]; then
		echo "${RED}ERROR: Cannot set up $FILE${NORMAL}"
	fi
}


INSTALL() {
	for file in $(ls -a $1/[a-zA-Z0-9]*)
	do
		if [ -f $file ]; then
			SET_FILE $(basename $file)
		fi
	done
}

# install basic plugins
INSTALL $SRCPATH

# install vim plugins
vim +PlugInstall +qall

# Setup pyenv
if [ ! -d ~/.pyenv ]; then
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

if [ ! -d ~/.pyenv/plugins/pyenv-virtualenv ]; then
    git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi

echo "${GREEN}Installation is complete${NORMAL}"
