set -x EDITOR code --wait

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
set -x PATH $PATH (ghq root)/chromium.googlesource.com/chromium/tools/depot_tools

set -x PATH $PATH $HOME/workspace/depot_tools
set -x PATH $PATH /opt/homebrew/opt/libpq/bin

set -U Z_CMD "j"

## Alias
alias gst "git st"
alias codew "code --wait"
alias br 'git branch | sed -r "s/^[ \*]+//" | peco'

## Abbr


function g
  if test (count $argv) -gt 0
    git $argv
  else
    git s
  end
end

function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)' # Bind for prco history to Ctrl+r
  bind \c] 'stty sane; peco_select_ghq_repository' # Bind for prco change directory to Ctrl+]
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tgfjt/workspace/google-cloud-sdk/path.fish.inc' ]; . '/Users/tgfjt/workspace/google-cloud-sdk/path.fish.inc'; end


omf theme l
set fish_greeting

