A custom dotfile configuration based on the excellent [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework by [Robby Russell](https://github.com/robbyrussell).

####Installation
_NOTE:_  Git is required for installation.

```
curl "https://raw.githubusercontent.com/jonoliver/dotfiles/master/script/install.sh" | sh
```

This will do the following:

- Install oh-my-zsh at `~/.oh-my-zsh` (if not already installed)
- Install dotfiles at `~/dotfiles` (backing up any existing "dotfiles" directory)
- Symlink `~/dotfiles/zshrc` to `~/.zshrc` (backing up any existing ".zshrc" file)
  
####That's nice, but let's install some cool stuff!
```
dot && ./script/tool_installer.sh
```
This will install lots of useful stuff, including:

- [RVM](https://rvm.io/)
  - Latest Ruby
- [Homebrew](http://brew.sh/)
  - [git](http://git-scm.com/)
  - [wget](https://www.gnu.org/software/wget/)
  - [tree](http://mama.indstate.edu/users/ice/tree/)
  - [ack](http://beyondgrep.com/)
  - [tmux](http://tmux.sourceforge.net/)
  - [node.js](http://nodejs.org/)
- [Npm](https://www.npmjs.org/)
  - [Grunt](http://gruntjs.com/)
  - [Yeoman](http://yeoman.io/)
  - [CoffeeScript](http://coffeescript.org/)
  - [MongoDB](https://www.mongodb.org/)
  - [Mocha](http://visionmedia.github.io/mocha/)
  - [Express](http://expressjs.com/)