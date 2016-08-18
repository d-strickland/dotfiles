# Dotfiles
Common settings for development.

# Installation
    git clone git@github.com:d-strickland/dotfiles.git
    cd dotfiles
    ./install.sh

The install script will do several things:

1. Create symlinks to your local copy of this project from the home directory.
   Any existing files will be backed up automatically.
2. Clone the VundleVim plugin into .vim/bundle/Vundle.vim
3. Run Vundle to install all vim plugins listed in .vimrc

