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
