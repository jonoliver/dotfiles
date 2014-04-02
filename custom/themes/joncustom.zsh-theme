machine_details(){
  local output=''
  if [ "$THEME_USERNAME" = true ]; then
    output+='%n'
  fi

  if [ "$THEME_MACHINENAME" = true ]; then
    if [ ! "$output" = '' ]; then
      output+='@'
    fi
    output+='%m'
  fi

  if [ ! "$output" = '' ]; then
    echo "$output "
  fi
}

show_ruby_version(){
# based on eastwood theme(s)
# RVM settings
if [[ -s ~/.rvm/scripts/rvm ]] ; then 
  echo $(~/.rvm/bin/rvm-prompt)
else
  if which rbenv &> /dev/null; then
    echo $(rbenv version | sed -e 's/ (set.*$//')
  fi
fi  
}

right_prompt(){
  local output=''
  if [ "$THEME_RUBYVERSION" = true ]; then
    output+="%{$fg[yellow]%}"
    output+=$(show_ruby_version)
    output+="%{$reset_color%}"
  fi

  if [ "$THEME_DATETIME" = true ]; then
    if [ ! "$output" = '' ]; then
      output+='  '
    fi
    output+="%{$fg[red]%}%w %t%{$reset_color%}"
  fi

  output+=" $EPS1"
  echo $output
}

RPS1='$(right_prompt)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  if [ "$SHOWTIME" = true ]; then
    echo 'test'
  fi
}

local ret_status="%(?:%{$fg[green]%}❯:%{$fg[red]%}❯)%{$reset_color%}"
PROMPT='%{$fg[cyan]%}%~%  %{$reset_color%}$(git_custom_status) 
$(machine_details)$ret_status '

#SHOWTIME=false
if [ "$SHOWTIME" ]; then
  echo 'test'
fi