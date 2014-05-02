# Optional prompt settings for custom theme
#THEME_USERNAME=true
#THEME_MACHINENAME=true
#THEME_RUBYVERSION=true
#THEME_DATETIME=true

DEFAULT_EDITOR='mvim'
DEFAULT_EDITOR_REMOTE='vim'
GIT_EDITOR='vim'

seteditor(){
  # Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR=$EDITORREMOTE
  else
    export EDITOR=$EDITORLOCAL
  fi
}

setenv(){
  # Preferred theme settings for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    THEME_USERNAME=true
    THEME_MACHINENAME=true
    THEME_RUBYVERSION=false
    THEME_DATETIME=true
  else
    THEME_USERNAME=false
    THEME_MACHINENAME=false
    THEME_RUBYVERSION=false
    THEME_DATETIME=true
  fi
}

defaultenv(){
  EDITORLOCAL="$DEFAULT_EDITOR"
  EDITORREMOTE="$DEFAULT_EDITOR_REMOTE"
  seteditor
  setenv
}

rubyenv(){
  defaultenv

  #EDITORLOCAL='vim'
  THEME_RUBYVERSION=true

  seteditor
}

rebaseenv(){
  EDITOR='vim'
}

defaultenv
