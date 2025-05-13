# prompt fns: git branch and hello message
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('🍂 $branch') '
  fi
}
function prompt_dir() {
  if [[ "$PWD" == "$HOME" ]]; then
    echo "Hello!"
  else
    print -P '%~'
  fi
}

# color and prompt
setopt PROMPT_SUBST
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

PROMPT='%B%K{229}%F{27}%D{%m-%d %H:%M} %F{96}$(prompt_dir) %F{22}$(git_branch_name)%F{96}❯%f%k%b '
