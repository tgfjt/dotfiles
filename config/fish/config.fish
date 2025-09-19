set -x EDITOR code --wait

### brew
# Static homebrew environment (faster than eval)
set -gx HOMEBREW_PREFIX "/opt/homebrew"
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar"
set -gx HOMEBREW_REPOSITORY "/opt/homebrew"
fish_add_path --global --move --path "/opt/homebrew/bin" "/opt/homebrew/sbin"
# eval (/opt/homebrew/bin/brew shellenv)  # original (slower)

### GOLANG
# miseでGoを管理
if command -v go > /dev/null
    set -x GOPATH (go env GOPATH)
    set -x GOBIN $GOPATH/bin
end

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
# ghq paths (cached)
set -l ghq_root_path ~/ghq  # or use: set -l ghq_root_path (ghq root) once
set -x PATH $PATH $ghq_root_path/github.com/tgfjt/commands
set -x PATH $PATH $ghq_root_path/chromium.googlesource.com/chromium/tools/depot_tools

set -x PATH $PATH $HOME/workspace/depot_tools
set -x PATH $PATH /opt/homebrew/opt/libpq/bin

set -U Z_CMD "j"

## Alias
alias gst "git st"
alias codew "code --wait"
alias br 'git branch | sed -r "s/^[ \*]+//" | peco'
alias storage "df -h / | tail -1 | awk '{print \"💾 Storage: \" \$3 \" / \" \$2 \" (\" \$5 \" used)\"}'"

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
  bind ] 'stty sane; peco_select_ghq_repository' # Bind for prco change directory to Ctrl+]
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tgfjt/workspace/google-cloud-sdk/path.fish.inc' ]; . '/Users/tgfjt/workspace/google-cloud-sdk/path.fish.inc'; end

# https://github.com/oh-my-fish/oh-my-fish/blob/master/docs/Themes.md#l
omf theme l
# シンプルなグリーティング（または削除してもOK）
set fish_greeting ""

~/.local/bin/mise activate fish | source

# pnpm
set -gx PNPM_HOME "/Users/tgfjt/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

starship init fish | source

# Added by Windsurf
fish_add_path /Users/tgfjt/.codeium/windsurf/bin


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# Claude Code
set -x ENABLE_BACKGROUND_TASKS 1
set -x FORCE_AUTO_BACKGROUND_TASKS 1

alias cc '~/.claude/hooks/manual-tweet.sh'

# kiro (disabled - too slow)
# string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)
