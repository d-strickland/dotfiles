#!/bin/bash

mkdir ~/.emacs.d

TARGETS=('.gitconfig' '.gitignore' '.vimrc' '.vim' '.emacs.d/init.el')
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
