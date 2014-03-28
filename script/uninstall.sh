#!/bin/bash
#undo everything done in install.sh
#rm -rf $HOME/.dotfiles
#rm $HOME/zshrc
#rm $HOME/.ssh/config

# Temporary "uninstall" for testing
cd $HOME
#mv .oh-my-zsh .oh-my-zsh.bak
#mv dotfiles dotfiles.bak

rm -rf dotfiles
rm -rf .oh-my-zsh
rm .zshrc

chsh -s /bin/bash