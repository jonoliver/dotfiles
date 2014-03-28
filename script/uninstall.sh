#!/bin/bash
#undo everything done in install.sh
#rm -rf $HOME/.dotfiles
#rm $HOME/zshrc
#rm $HOME/.ssh/config

# Temporary "uninstall" for testing
cd $HOME

backup=true

if [ $backup = true ]; then

  mv .oh-my-zsh .oh-my-zsh.bak
  mv dotfiles dotfiles.bak
  mv .rvm .rvm.bak
else
  rm -rf dotfiles
  rm -rf .oh-my-zsh
  rm -rf .rvm
fi

rm .zshrc
chsh -s /bin/bash