#!
alias rm='rm -Rf'
alias mv='mv -i'
alias cp='cp -i'

# Add some easy shortcuts for formatted directory listings and add a touch of color.
alias ll='ls -l --color=auto'
alias la='ls -al --color=auto'
alias ls='ls --color=auto'
alias tree='tree -C'
# Make grep more user friendly by highlighting matches
# and exclude grepping through .svn folders.
alias grep='grep --color=auto --exclude-dir=\.svn'
alias search='grep --color=auto --exclude-dir=\.svn -Ria '
# Shortcut for using the Kdiff3 tool for svn diffs.
alias svnkdiff3='svn diff --diff-cmd kdiff3'

# Just in case you make a typo...

alias clare='clear'
alias claer='clear'
alias clar='clear'
alias c='clear'
alias quit='exit'
alias q='exit'
alias morbius='ssh bweithers@morbius.mscsnet.mu.edu'
alias skaro='ssh bweithers@skaro.mscsnet.mu.edu'
alias mandalore='ssh bweithers@192.168.0.11'

alias compile='gcc -o runnable'
alias run='./runnable'

alias TA='cd ~brylow/os/demo/TA && ls'
alias lab='~brylow/os/demo/TA/.lab'
alias readlab='vim ~brylow/os/demo/TA/latest_lab'
alias RADE='cat ~bweithers/.radecanada.txt'
alias rade='RADE'
alias Rade='RADE'
alias sourcea='source .bash_aliases'
alias charlie='echo "Hello"'
alias python='python3'
alias manage='python3 manage.py'

function __setprompt
{
	local LAST_COMMAND=$? # Must come first!

	# Define colors
	local LIGHTGRAY="\033[0;37m"
	local WHITE="\033[1;37m"
	local BLACK="\033[0;30m"
	local DARKGRAY="\033[1;30m"
	local RED="\033[0;31m"
	local LIGHTRED="\033[1;31m"
	local GREEN="\033[0;32m"
	local LIGHTGREEN="\033[1;32m"
	local BROWN="\033[0;33m"
	local YELLOW="\033[1;33m"
	local BLUE="\033[0;34m"
	local LIGHTBLUE="\033[1;34m"
	local MAGENTA="\033[0;35m"
	local LIGHTMAGENTA="\033[1;35m"
	local CYAN="\033[0;36m"
	local LIGHTCYAN="\033[1;36m"
	local NOCOLOR="\033[0m"

	# Show error exit code if there is one
	if [[ $LAST_COMMAND != 0 ]]; then
		# PS1="\[${RED}\](\[${LIGHTRED}\]ERROR\[${RED}\])-(\[${LIGHTRED}\]Exit Code \[${WHITE}\]${LAST_COMMAND}\[${RED}\])-(\[${LIGHTRED}\]"
		PS1="\[${DARKGRAY}\](\[${LIGHTRED}\]ERROR\[${DARKGRAY}\])-(\[${RED}\]Exit Code \[${LIGHTRED}\]${LAST_COMMAND}\[${DARKGRAY}\])-(\[${RED}\]"
		if [[ $LAST_COMMAND == 1 ]]; then
			PS1+="General error"
		elif [ $LAST_COMMAND == 2 ]; then
			PS1+="Missing keyword, command, or permission problem"
		elif [ $LAST_COMMAND == 126 ]; then
			PS1+="Permission problem or command is not an executable"
		elif [ $LAST_COMMAND == 127 ]; then
			PS1+="Command not found"
		elif [ $LAST_COMMAND == 128 ]; then
			PS1+="Invalid argument to exit"
		elif [ $LAST_COMMAND == 129 ]; then
			PS1+="Fatal error signal 1"
		elif [ $LAST_COMMAND == 130 ]; then
			PS1+="Script terminated by Control-C"
		elif [ $LAST_COMMAND == 131 ]; then
			PS1+="Fatal error signal 3"
		elif [ $LAST_COMMAND == 132 ]; then
			PS1+="Fatal error signal 4"
		elif [ $LAST_COMMAND == 133 ]; then
			PS1+="Fatal error signal 5"
		elif [ $LAST_COMMAND == 134 ]; then
			PS1+="Fatal error signal 6"
		elif [ $LAST_COMMAND == 135 ]; then
			PS1+="Fatal error signal 7"
		elif [ $LAST_COMMAND == 136 ]; then
			PS1+="Fatal error signal 8"
		elif [ $LAST_COMMAND == 137 ]; then
			PS1+="Fatal error signal 9"
		elif [ $LAST_COMMAND -gt 255 ]; then
			PS1+="Exit status out of range"
		else
			PS1+="Unknown error code"
		fi
		PS1+="\[${DARKGRAY}\])\[${NOCOLOR}\]\n"
	else
		PS1=""
	fi

	# Date
	PS1+="\[${DARKGRAY}\](\[${LIGHTBLUE}\]\$(date +'%A,') $(date +'%B %d' )" # Date
	PS1+="${LIGHTGREEN} $(date +'%-I':'%M%P')\[${DARKGRAY}\])" # Time

	# User and server
	local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
	local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
	if [ $SSH2_IP ] || [ $SSH_IP ] ; then
		PS1+="(\[${LIGHTMAGENTA}\]\u\\[${DARKGRAY}\]@\[${CYAN}\]\h"
	else
		PS1+="(\[${LIGHTMAGENTA}\]\u"
	fi

	# Current directory
	PS1+="\[${DARKGRAY}\]:\[${BROWN}\]\w\[${DARKGRAY}\]) "

	# Skip to the next line
	PS1+="\n"

	if [[ $EUID -ne 0 ]]; then
		PS1+="\[${GREEN}\]>\[${NOCOLOR}\] " # Normal user
	else
		PS1+="\[${RED}\]>\[${NOCOLOR}\] " # Root user
	fi

	# PS2 is used to continue a command using the \ character
	PS2="\[${DARKGRAY}\]>\[${NOCOLOR}\] "

	# PS3 is used to enter a number choice in a script
	PS3='Please enter a number from above list: '

	# PS4 is used for tracing a script in debug mode
	PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
}
PROMPT_COMMAND='__setprompt'

cd
