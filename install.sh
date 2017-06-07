#!/bin/bash

TARGETS=('.gitconfig' '.gitignore' '.vimrc' '.vim')
for T in ${TARGETS[*]}; do
    if [ -a ~/$T ]
        then 
            mv ~/$T ~/$T.`date +%Y%m%d%H%`
    fi
    ln -s `pwd`/$T ~/$T
    echo "Created symlink for $T"
done

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

exit 0
