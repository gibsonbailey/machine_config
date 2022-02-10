source ~/.shell_common

setopt PROMPT_SUBST
PROMPT='%9c%{%F{051}%}$(parse_git_branch)%{%F{none}%} >> '

alias graph="git log --graph --abbrev-commit --decorate --format=format:'%C(bold yellow)%h%C(reset) - %C(green)(%ar)%C(reset)%C(bold white) %s%C(reset) %C(dim     white)- %an%C(reset)%C(auto)%d%C(reset)' --all"

# Load Git Completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
