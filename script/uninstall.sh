#!/bin/bash

rm -rf $HOME/dotfiles
rm -rf $HOME/.oh-my-zsh
rm .zshrc

if [ -f "$HOME/.zshrc.bak" ]; then
  mv $HOME/.zshrc.bak $HOME/.zshrc
fi

chsh -s /bin/bash