#!/usr/bin/env bash

#======================================================================#
#    _        _                _ _ _         _____ _                   #
#   /_\  _ __| |_  _ _ ___  __| (_) |_ ___  |_   _| |_  ___ _ __  ___  #
#  / _ \| '_ \ ' \| '_/ _ \/ _` | |  _/ -_)   | | | ' \/ -_) '  \/ -_) #
# /_/ \_\ .__/_||_|_| \___/\__,_|_|\__\___|   |_| |_||_\___|_|_|_\___| #
#       |_|                                                            #
#                                                                      #
#                       Aphrodite Terminal Theme                       #
#                 by Sergei Kolesnikov a.k.a. win0err                  #
#                                                                      #
#                        https://kolesnikov.se                         #
#                                                                      #
#======================================================================#


export VIRTUAL_ENV_DISABLE_PROMPT=true


__aphrodite_update_prompt_data() {
	local RETVAL=$?

	__aphrodite_venv=''
	[[ -n "$VIRTUAL_ENV" ]] && __aphrodite_venv=$(basename "$VIRTUAL_ENV")

	__aphrodite_git=''
	__aphrodite_git_color=$(tput setaf 10)  # clean
	local git_branch=$(git --no-optional-locks branch --show-current 2> /dev/null)
	if [[ -n "$git_branch" ]]; then
		local git_status=$(git --no-optional-locks status --porcelain 2> /dev/null | tail -n 1)
		[[ -n "$git_status" ]] && __aphrodite_git_color=$(tput setaf 11)  # dirty
		__aphrodite_git="‹${git_branch}›"
	fi

	__aphrodite_prompt_symbol_color=$(tput sgr0)
	[[ "$RETVAL" -ne 0 ]] && __aphrodite_prompt_symbol_color=$(tput setaf 1)


	return $RETVAL  # to preserve retcode
}


if [[ -n "$git_branch" ]]; then
	PROMPT_COMMAND="$PROMPT_COMMAND; __aphrodite_update_prompt_data"
else
	PROMPT_COMMAND="__aphrodite_update_prompt_data"
fi


PS1=''
PS1+='\[$(tput setaf 7)\]$(echo -ne $__aphrodite_venv)\[$(tput sgr0)\]'
PS1+='\[$(tput setaf 6)\]\u'
PS1+='\[$(tput setaf 8)\]@'
PS1+='\[$(tput setaf 12)\]\h'
PS1+='\[$(tput setaf 8)\]:'
PS1+='\[$(tput sgr0)\]\w '
PS1+='\[$(echo -ne $__aphrodite_git_color)\]$(echo -ne $__aphrodite_git)\[$(tput sgr0)\] '
PS1+='\[$(tput setaf 8)\]\[$([[ -n "$APHRODITE_THEME_SHOW_TIME" ]] && echo -n "[\t]")\]\[$(tput sgr0)\]'
PS1+='\[$(tput sgr0)\]\n'
PS1+='\[$(echo -ne $__aphrodite_prompt_symbol_color)\]\$\[$(tput sgr0)\] '
