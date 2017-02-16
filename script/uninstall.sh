#!/bin/bash

rm -rf $HOME/.dotfiles
rm -rf $HOME/.oh-my-zsh
rm .zshrc
rm .tmux.conf

if [ -f "$HOME/.zshrc.bak" ]; then
  mv $HOME/.zshrc.bak $HOME/.zshrc
fi

if [ -f "$HOME/.tmux.conf.bak" ]; then
  mv $HOME/.tmux.conf.bak $HOME/.tmux.conf
fi

chsh -s /bin/bash
