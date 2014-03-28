#!/bin/bash

install_ruby(){
  echo "Installing RVM..."
  mkdir -p ~/.rvm/src && cd ~/.rvm/src && rm -rf ./rvm && \
  git clone --depth 1 git://github.com/wayneeseguin/rvm.git && \
  cd rvm && ./install

  rubyversion='2.1.1'
  echo "Installing Ruby $rubyversion ..."
  rvm install "$rubyversion"
  rvm --default "$rubyversion"
}

install_rubygems(){
  echo 'Installing ruby gems...'
  gem install --no-ri --no-rdoc rails
}

install_homebrew(){
  echo 'Installing homebrew...'
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

  echo 'Installing homebrew packages'
  brew bundle ~/dotfiles/Brewfile
}

install_npm(){
  echo "Installing npm packages..."
  npm install -g grunt-cli
  npm install -g yo

  npm install -g coffee-script
  npm install -g mongodb
  npm install -g express
  npm install -g mocha
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
  bak $HOME/.ssh/config

  git clone https://github.com/jonoliver/dotfiles.git $DOT

  # Create symbolic links
  ln -s $DOT/zshrc $HOME/.zshrc  
  #ln -s $HOME/config/ssh $HOME/.ssh/config 

  # Make bin files executable
  chmod +x $DOTFILES/bin
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

echo "Installing tools/dependencies"
install_ruby
install_rubygems
install_homebrew
install_npm

install_zsh
install_dotfiles

#change shell to zsh
if [ ! "$SHELL" = "/bin/zsh" ]; then
  chsh -s /bin/zsh
fi

echo "Installation complete! Restart your terminal."