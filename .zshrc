source ~/.shell_common

export DYLD_LIBRARY_PATH="/opt/homebrew/opt/libvmaf/lib:$DYLD_LIBRARY_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libvmaf/lib/pkgconfig:$PKG_CONFIG_PATH"


alias vulnerable_chrome='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_test" --disable-web-security'

# This function returns the architecture if it's not arm64
function architecture() {
  arch_name=$(arch)
  if [ $arch_name != "arm64" ]; then
    echo "%{%F{yellow}%}%B$arch_name%b%{%F{none}%} "
  fi
}

if [ $(arch) = "i386" ]; then
    # Hint: To start up connection to db, run:
    # mssql-cli -S ip_address -U username -P password -d database_name
    alias brew='/usr/local/bin/brew'
    alias func="/usr/local/Cellar/azure-functions-core-tools@4/4.0.5095/func"
    PATH=/usr/local/Cellar/python@3.9/3.9.16/bin:$PATH
  else 
    alias brew='/opt/homebrew/bin/brew'
fi

setopt PROMPT_SUBST
PROMPT='$(architecture)%B%F{cyan}%9c%{%F{green}%}%b$(parse_git_branch)%{%F{none}%}%B%F{cyan} >> %b%f'

setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

alias graph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold yellow)%h%C(reset) - %C(green)(%ar)%C(reset)%C(bold white) %s%C(reset) %C(dim     white)- %an%C(reset)%C(auto)%d%C(reset)' --all"

# Load Git Completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Custom history search
fzf_history_search() {
  fc -R  # reload history from file into memory
  
  local selected
  selected=$(
    fc -l 1 | 
    awk '
      {
        cmd = $0;
        sub(/^[[:space:]]*[0-9]+[[:space:]]+/, "", cmd);
        line = $0;
        num = $1;
        
        # Store highest history number for each unique command
        if (!seen[cmd] || num > max_num[cmd]) {
          max_num[cmd] = num;
          entry[cmd] = line;
        }
        seen[cmd] = 1;
      }
      END {
        # Output entries sorted by history number
        for (cmd in entry) {
          print entry[cmd];
        }
      }
    ' | 
    sort -nr |
    fzf --no-sort
  )
  
  if [[ -n "$selected" ]]; then
    # Remove the history number at the beginning
    BUFFER="$(echo "$selected" | sed -E 's/^[[:space:]]*[0-9]+[[:space:]]+//')"
    CURSOR=$#BUFFER
  fi
  
  zle reset-prompt
}

zle -N fzf_history_search
bindkey '^R' fzf_history_search
