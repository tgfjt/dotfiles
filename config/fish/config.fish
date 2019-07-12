set -x EDITOR code

### GOLANG
set -x GOROOT /usr/local/opt/go/libexec
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
set -x PATH $PATH $HOME/flutter/flutter/bin
set -x PATH $PATH $HOME/flutter/flutter/.pub-cache/bin
set -x PATH $PATH $GOPATH/src/fuchsia.googlesource.com/scripts/fuchsia/.jiri_root/bin
set -x PATH $PATH $HOME/.deno/bin
set -x PATH $HOME/workspace/google-cloud-sdk/platform/google_appengine $PATH
set -x MEMOLIST_DIR ~/Dropbox/memo

set -x PATH $PATH $HOME/workspace/depot_tools

### rbenv
set -x RBENV_ROOT /usr/local/var/rbenv
rbenv init - | source

## Alias
alias tmls 'tmux ls'
alias tma 'tmux a -t'
alias gst "git st"

# set fish_plugins theme peco

function peco_select_history
  if set -q $argv
    history | peco | read line; commandline $line
  else
    history | peco --query $argv | read line; commandline $line
  end
end

function peco_select_repository
  if set -q $argv
    ghq list -p | peco | read line; builtin cd $line
  else
    ghq list -p | peco --query $argv | read line; builtin cd $line
  end
  set -e line
end

#function peco
#  command peco --layout=bottom-up $argv
#end

#fzf
alias cf '__fzf_find_file'
alias cdd '__fzf_cd'

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
  bind \c] peco_select_repository # Bind for prco change directory to Ctrl+]
end

# IRHydra
set -x hydra '--trace-hydrogen --trace-phase=Z --trace-deopt --code-comments --hydrogen-track-positions --redirect-code-traces --redirect-code-traces-to=code.asm'

# Chrome
alias hydra='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --no-sandbox --js-flags="--user-data-dir=/tmp/profile --trace-hydrogen --trace-phase=Z --trace-deopt --code-comments --hydrogen-track-positions --redirect-code-traces"'

# Ninja
set -x GYP_GENERATORS ninja
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tgfjt/workspace/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/tgfjt/workspace/google-cloud-sdk/path.fish.inc'; else; . '/Users/tgfjt/workspace/google-cloud-sdk/path.fish.inc'; end; end
set -g fish_user_paths "/usr/local/opt/opencv@2/bin" $fish_user_paths
