clear
printf "                    +      \n"
printf "\n\n"
printf "                                        +            + \n"
printf "                _..._                           +                 \n"
printf "     +        .'     '.      _ \n"
printf "             /    .-\"\"-\\   _/ \\                            \n"
printf "           .-|   /:.   |  |   | \n"
printf "           |  \\  |:.   /.-'-./             + \n"
printf "           | .-'-;:__.'    =/ \n"
printf "           .'=  *=|NASA _.='            Welcome back, Bailey! \n"
printf "          /   _.  |    ;                  Do good work, son! \n"
printf "         ;-.-'|    \\   | \n"
printf "        /   | \\    _\\  _\\                                            + \n"
printf "        \\__/'._;.  ==' ==\\ \n"
printf "                 \\    \\   | \n"
printf "                 /    /   / \n"
printf "        +        /-._/-._/                 + \n"
printf "                 \\   \`\\  \\ \n"
printf "                  \`-._/._/                    +                           \n"
printf "\n\n"


PS1="\u:\w >> "

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

alias ll="ls -al"
alias get_ip="curl ipecho.net/plain ; echo"
alias python="python3"
alias gs="git status"
alias up="docker-compose up -d"
alias down="docker-compose down"
alias dc="docker-compose"
alias ded="docker exec -it django /bin/bash"
alias dld="docker logs -f django"
alias runlocal="python manage_dev.py runserver 0.0.0.0:3333"
alias dsp="python manage_dev.py shell_plus"



# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/gibsonbailey/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/gibsonbailey/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/gibsonbailey/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/gibsonbailey/Downloads/google-cloud-sdk/completion.bash.inc'; fi
alias graph="git lg"
alias graphold="git log --decorate --graph --all --oneline"

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
