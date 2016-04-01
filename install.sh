#!/bin/bash

TARGETS=('.gitconfig' '.gitignore' '.vimrc' '.vim')
for T in ${TARGETS[*]}; do
    if [ -a ~/$T ]
        then 
            mv ~/$T ~/$T.bak
    fi
    ln -s `readlink -e $T` ~/$T
    echo "Created symlink for $T"
done

git clone git@github.com:VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

exit 0
