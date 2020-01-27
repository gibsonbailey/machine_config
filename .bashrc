source ~/.shell_common
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export PS1='%9c%{%F{green}%}$(parse_git_branch)%{%F{none}%} >> '
