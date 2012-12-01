COLOR_RESTORE='\033[0m'

RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
GRAY='\033[00;37m'

LBLACK='\033[01;30m'
LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

function display_prompt() {
	echo "\n$LBLACK\w"
	echo -ne "$WHITE"
	echo -ne "["
	echo -ne "$LGREEN"
	echo -ne "$USERDOMAIN"
	echo -ne "$WHITE"
	echo -ne "."
	echo -ne "$LGREEN"
	echo -ne "$USERNAME"
	echo -ne "$WHITE"
	echo -ne "@"
	echo -ne "$LCYAN"
	echo -ne "$COMPUTERNAME"
	echo -ne "$WHITE"
	echo -ne "]"
	echo -ne "$LRED"
	echo -ne "►"
	echo -ne "$COLOR_RESTORE "
}

PS1="$(display_prompt)"
