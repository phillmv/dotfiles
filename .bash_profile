if [ ! -z "$CODESPACES" ]; then
  . $HOME/.bashrc
else
  export PS1='\[\e[1;32m\]\h\[\e[1;34m\]:\w $\[\e[00m\] '
fi

alias branch="git branch"
alias status="git status"
alias checkout="git checkout"
alias ls='ls --color'
set -o vi
