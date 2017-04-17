A custom dotfile configuration based on the excellent [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) framework by [Robby Russell](https://github.com/robbyrussell).

## Setup
#### Installation
_NOTE:_  Git is required for installation.

```
curl "https://raw.githubusercontent.com/jonoliver/dotfiles/master/script/install.sh" | sh
```

The above command will do the following:

- Install oh-my-zsh at `~/.oh-my-zsh` (if not already installed)
- Install dotfiles at `~/.dotfiles` (backing up any existing "dotfiles" directory)
- Symlink `~/.dotfiles/zshrc` to `~/.zshrc` (backing up any existing ".zshrc" file)

#### That's nice, but let's install some cool stuff!
```
dot && ./script/tool_installer.sh
```
The above command will install lots of useful stuff, including:

- [RVM](https://rvm.io/)
  - Latest [Ruby](https://www.ruby-lang.org/en/)
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

## Features
### Customization
The `/custom` directory is used to override the default oh-my-zsh functionality. Any configuration files added to this directory with a `.zsh` extension will automtically be loaded when the Terminal is started. More information can be found in the [oh-my-zsh README](https://github.com/robbyrussell/oh-my-zsh#customization).

##### Environment
[`env.zsh`](https://github.com/jonoliver/dotfiles/blob/master/custom/env.zsh) contains configuration settings related to environment and theme. You can modify this file to change how your Terminal looks and acts based on your environment.

You can also define functions to change these settings based on the type of coding environment you are working in. For example, running `rubyenv` will customize the Terminal for a Ruby environment, changing your editor and displaying the Ruby version in the prompt (if running RVM or rbenv). Running `defaultenv` will restore the original default settings.

##### Theme
Commando is a custom theme located under `custom/themes`. This theme includes several variables which can be set in order to display certain information in the command prompt:

	THEME_USERNAME=true      #Display the username
	THEME_MACHINENAME=true   #Display the machine name
	THEME_RUBYVERSION=true   #Display the ruby version
	THEME_DATETIME=true      #Display the date/time

These variables can be set directly from the command line or from [`env.zsh`](https://github.com/jonoliver/dotfiles/blob/master/custom/env.zsh) or any other `.zsh` file in the `/custom` directory.

### Aliases
This configuration was built with productivity in mind. As such, the ability to easily manage and recall custom aliases is an important requirement. There are several aliases that exist to help with this functionality:

	# reload all config files
	alias rl="source $DOTFILES/zshrc"

	# display aliases
	alias al="alias"

	# reload aliases
	alias arl="source $ALIASFILE"

	# edit aliases
	alias aed='$EDITOR $ALIASFILE'

	# search aliases for pattern
	alias ag='alias | grep'

### Private files
Any files containing `.private.` in the filename will not be tracked by git. This is useful for adding `.zsh` configuration files to the `custom` folder that may contain private information or machine specific information. For example, a user may include a `user.private.zsh` on their local machine, or a `server.private.zsh` on their server containing private configuration details.
### Bonus: Extra color schemes for iTerm users
If you are using [iTerm](http://iterm.sourceforge.net/) (and if you're on a Mac, you probably should be), there are a few color schemes available in the `/iterm` directory. These are modified versions of of some of the schemes that can be found at [iterm2colorschemes.com](http://iterm2colorschemes.com/). Installation instructions can be found [here](https://code.google.com/p/iterm2/wiki/ColorGallery).
