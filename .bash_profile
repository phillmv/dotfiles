export BASH_SILENCE_DEPRECATION_WARNING=1 # for osx

# set up the prompt how I like it:
if [ ! -z "$CODESPACES" ]; then
  . $HOME/.bashrc
else
  export PS1='\[\e[1;32m\]\h\[\e[1;34m\]:\w $\[\e[00m\] '
fi

# path chicanery
if [ -e $HOME/bin ]; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -e /opt/homebrew/opt/coreutils/libexec/gnubin ]; then
  export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
fi

if [ -e $HOME/github/github/bin ]; then
  export PATH="$PATH:$HOME/github/github/bin"
fi

if [ -e $HOME/go/bin ]; then
  export PATH="$PATH:$HOME/go/bin"
fi

if [ -e /usr/local/opt/node@18/bin ]; then
  export PATH="/usr/local/opt/node@18/bin:$PATH"
fi

if [ -e /Library/Frameworks/Python.framework/Versions/2.7/bin ]; then
  export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
fi

# misc
export HISTSIZE=10000

alias g=mvim

alias ls='ls --color'
alias be='bundle exec'
alias taggit='ctags -R --exclude=.git --exclude=log --exclude=tmp *'
alias branch="git branch"
alias status="git status"
alias checkout="git checkout"
alias mux='tmux -CC new -A -s main'
alias ghfwd="gh cs ports forward 80:80 3012:3012"
alias n="nvim"

set -o vi

# https://github.com/github/goproxy/blob/51fd5fa8eaf572f2eced81e946f50dd00ee9cffa/doc/user.md#set-up
export GOPROXY="${GOPROXY:-'https://goproxy.githubapp.com/mod,https://proxy.golang.org/,direct'}"
export GOPRIVATE=
export GONOPROXY=
export GONOSUMDB="${GONOSUMDB:-'github.com/github/*'}"

# for apple silicon
if [ -e /opt/homebrew/opt/go/libexec ]; then
  export GOROOT=/opt/homebrew/opt/go/libexec
fi

agig() {
  command ag --ignore 'packages/*/test' --ignore test "$@" .
}

# Function to alias "llm" to "gh models run" with configurable model
function gmr() {
  # Use the value of LLM_MODEL if set, otherwise fall back to a default model
  local model="${LLM_MODEL:-openai/gpt-4o}"

  # Run the command with the specified (or default) model
  gh models run "$model" "$@"
}

if [ -e /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
