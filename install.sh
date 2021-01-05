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

COPY_FILE() {
    FILE=$(basename $1)
    TARGET_DIR=$2
    HIDDEN_FILE=$3

    if $HIDDEN_FILE; then
        FILE=".$FILE"
    fi

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
    mkdir -p $TARGET_DIR
	cp $1 $TARGET_DIR/$FILE
	if [ ! $? -eq "0" ]; then
		echo "${RED}ERROR: Cannot set up $FILE${NORMAL}"
	fi
}


COPY_DIR() {
    DIR=$1
    TARGET_DIR=$2
    HIDDEN_FILE=$3

	for FILE in $(ls -a $DIR/[a-zA-Z0-9]*)
    do
		if [ -f $FILE ]; then
			COPY_FILE $FILE $TARGET_DIR $HIDDEN_FILE
		fi
	done
}

# install vim plugins
COPY_FILE vim/vimrc $HOME true
COPY_DIR vim/ftplugin $HOME/.vim/ftplugin false
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# install tmux configuration
COPY_FILE tmux/tmux.conf $HOME true
COPY_FILE tmux/tmux.conf.local $HOME true

# install bashrc and inputrc
COPY_FILE bash/bashrc $HOME true
COPY_FILE bash/inputrc $HOME true

# set up pyenv
if [ ! -d ~/.pyenv ]; then
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv
fi

if [ ! -d ~/.pyenv/plugins/pyenv-virtualenv ]; then
    git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
fi

# set up git prompt
if [ ! -d ~/.bash/git-aware-prompt ]; then
    git clone git://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt
fi

echo "${GREEN}Installation is complete${NORMAL}"
