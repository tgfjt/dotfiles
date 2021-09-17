set -x EDITOR code --wait

set fish_greeting

### brew
eval (/opt/homebrew/bin/brew shellenv)

### GOLANG
#set -x GOROOT /usr/local/opt/go/libexec
set -x GOPATH $HOME/dev

### PATH
set -x PATH $PATH ./vendor/bin
set -x PATH $PATH $HOME/bin
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH /usr/local/bin $PATH
set -x PATH $PATH $HOME/.nodebrew
set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $PATH $GOROOT/bin
set -x PATH $PATH $GOPATH/bin
set -x GOBIN $GOPATH/bin
set -x PATH $PATH $HOME/flutter/bin
set -x PATH $PATH $HOME/flutter/.pub-cache/bin
set -x PATH $PATH $HOME/.deno/bin
set -x PATH $HOME/workspace/google-cloud-sdk/platform/google_appengine $PATH
set -x PATH $HOME/.ebcli-virtual-env/executables $PATH
set -x PATH $PATH (ghq root)/github.com/tgfjt/commands

set -x PATH $PATH $HOME/workspace/depot_tools

### rbenv
status --is-interactive; and source (rbenv init -|psub)

## Alias
alias tmls 'tmux ls'
alias tma 'tmux a -t'
alias gst "git st"
alias codew "code --wait"

function peco_select_history
  if set -q $argv
    history | peco | read line; commandline $line
  else
    history | peco --query $argv | read line; commandline $line
  end
end

function peco_select_repository
  if set -q $argv
    repos | peco | read line; builtin cd $line
  else
    ghq list -p | peco --query $argv | read line; builtin cd $line
  end
  set -e line
end

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
  bind \c] peco_select_repository # Bind for prco change directory to Ctrl+]
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/workspace/google-cloud-sdk/path.fish.inc' ]; . '$HOME/workspace/google-cloud-sdk/path.fish.inc'; end

source ~/.iterm2_shell_integration.fish
