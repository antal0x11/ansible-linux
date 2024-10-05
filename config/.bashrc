function git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

BLACK='\[\033[0;30m\]'
RED='\[\033[0;31m\]'
GREEN='\[\033[0;32m\]'
YELLOW='\[\033[0;33m\]'
BLUE='\[\033[0;34m\]'
MAGENTA='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[0;37m\]'

BBLACK='\[\033[1;30m\]'
BRED='\[\033[1;31m\]'
BGREEN='\[\033[1;32m\]'
BYELLOW='\[\033[1;33m\]'
BBLUE='\[\033[1;34m\]'
BMAGENTA='\[\033[1;35m\]'
BCYAN='\[\033[1;36m\]'
BWHITE='\[\033[1;37m\]'

RESET='\[\033[0m\]'

PS1="${debian_chroot:+($debian_chroot)}[${BYELLOW}$(date +%d/%m/%Y) \t${RESET} ${BLUE}=>${RESET} ${RED}$(hostname -f)${RESET}] ${BBLUE}-${RESET} [ ${GREEN}\w${RESET} ] \n[${BYELLOW}\u${RESET}] ${RED}::${RESET}${BLUE}\$(git_branch)${RESET} ${BYELLOW}> ${RESET}"

alias ls='ls -G'