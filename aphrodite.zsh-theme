ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local welcome_symbol='\$'
[ $EUID -ne 0 ] || welcome_symbol='#'

local DEFAULT=39
local BLACK=30
local RED=31
local GREEN=32
local YELLOW=33
local BLUE=34
local MAGENTA=35
local CYAN=36
local GRAY=37
local DARK_GRAY=90
local LIGHT_RED=91
local LIGHT_GREEN=92
local LIGHT_YELLOW=93
local LIGHT_BLUE=94
local LIGHT_MAGENTA=95
local LIGHT_CYAN=96
local WHITE=97

get_color_by_code() {
	echo $'\e[0;'${1}'m'
}

local ret_status="%(?.%{$reset_color%}.%{$fg[red]%})"

# local time_str="%{$fg[grey]%}[%*]%{$reset_color%}"

get_current_branch() {
	local branch=$(git_current_branch)
	if [ -n "$branch" ]; then
		echo "${ZSH_THEME_GIT_PROMPT_PREFIX}$(parse_git_dirty)‹${branch}›${ZSH_THEME_GIT_PROMPT_SUFFIX}"
	fi
}

export GREP_COLOR='1;31'

PROMPT='\
$(get_color_by_code $CYAN)%n\
$(get_color_by_code $DARK_GRAY)@\
$(get_color_by_code $LIGHT_BLUE)%m\
$(get_color_by_code $DARK_GRAY):\
$(get_color_by_code $DEFAULT)%~\
$(get_current_branch)
${ret_status}'${welcome_symbol}'%{$reset_color%} '
