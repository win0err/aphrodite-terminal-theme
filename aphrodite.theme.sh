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
export CONDA_CHANGEPS1=false


__aphrodite_cyan="\[$(tput setaf 6)\]"
__aphrodite_white="\[$(tput setaf 7)\]"
__aphrodite_brightblack="\[$(tput setaf 8)\]"
__aphrodite_brightblue="\[$(tput setaf 12)\]"
__aphrodite_reset="\[$(tput sgr0)\]"
__aphrodite_raw_red=$(tput setaf 1)

__aphrodite_git_dirty=$(tput setaf 11)
__aphrodite_git_clean=$(tput setaf 10)

__aphrodite_update_prompt_data() {
	local RETVAL=$?

	__aphrodite_venv=''
	[[ -n "$VIRTUAL_ENV" ]] && __aphrodite_venv=$(basename "$VIRTUAL_ENV")
	[[ -n "$CONDA_PREFIX" ]] && __aphrodite_venv=$(basename "$CONDA_PREFIX")
	[[ -n "${__aphrodite_venv}" ]] && __aphrodite_venv=$(printf '[%s] ' "${__aphrodite_venv}")

	__aphrodite_git=''
	__aphrodite_git_color=${__aphrodite_git_clean}  # clean
	local git_branch=$(git --no-optional-locks rev-parse --abbrev-ref HEAD 2> /dev/null)
	if [[ -n "$git_branch" ]]; then
		test -z "$(2>/dev/null git --no-optional-locks status --porcelain=v2 --untracked-files=no --ignored=no --ignore-submodules=all)" && __aphrodite_git_color=${__aphrodite_git_dirty}  # dirty
		__aphrodite_git="‹${git_branch}›"
	fi

	__aphrodite_prompt_symbol_color=''
	[[ "$RETVAL" -ne 0 ]] && __aphrodite_prompt_symbol_color=${__aphrodite_raw_red}

	# Terminal title
	printf "\033]2;%s\007" "${PWD/#$HOME/\~}"

	return $RETVAL  # to preserve retcode
}

PROMPT_COMMAND="__aphrodite_update_prompt_data"

PS1=''
PS1+="${__aphrodite_white}\${__aphrodite_venv}${__aphrodite_reset}"
PS1+="${__aphrodite_cyan}\u"
PS1+="${__aphrodite_brightblack}@"
PS1+="${__aphrodite_brightblue}\h"
PS1+="${__aphrodite_brightblack}:"
PS1+="${__aphrodite_reset}\w "
## git
PS1+='\[$(echo -ne $__aphrodite_git_color)\]'
PS1+='$(echo -ne $__aphrodite_git)'
PS1+="${__aphrodite_reset} "
## time
PS1+="${__aphrodite_brightblack}"
PS1+='\[$([[ -n "$APHRODITE_THEME_SHOW_TIME" ]] && echo -n "[\t]")\]'
PS1+="${__aphrodite_reset}\n"
## prompt symbol
PS1+='\[$(echo -ne $__aphrodite_prompt_symbol_color)\]'
PS1+="\$${__aphrodite_reset} "
