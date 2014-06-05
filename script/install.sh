#!/bin/bash

hash git >/dev/null || {
  echo 'git not installed'
  exit
}

bak(){
  i=1
  name="$@.bak"
  while [ -f "$name" ] || [ -d "$name" ]; do
    echo "$name exists"
    name="$@.bak.$i"
    i=$((i+1))
  done
  mv "$@" "$name"
}

install_zsh(){
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  else
    echo "oh-my-zsh is already installed"
  fi
}

install_dotfiles(){
  DOT=$HOME/dotfiles
  echo "Installing dotfiles"

  # backup any existing dotfiles folder,.zshrc, etc...
  bak $HOME/dotfiles
  bak $HOME/.zshrc
  bak $HOME/.tmux.conf
  #bak $HOME/.ssh/config

  git clone https://github.com/jonoliver/dotfiles.git $DOT

  # Create symbolic links
  ln -s $DOT/zshrc $HOME/.zshrc
  ln -s $DOT/tmux/tmux.conf $HOME/.tmux.conf
  #ln -s $HOME/config/ssh $HOME/.ssh/config

  # Make bin files executable
  #chmod +x $DOTFILES/bin
}

install_zsh
install_dotfiles

#change shell to zsh
if [ ! "$SHELL" = "/bin/zsh" ]; then
  chsh -s /bin/zsh
fi

echo "Installation complete! Restart your terminal."
