#!/usr/bin/env fish

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


function fish_prompt --description Aphrodite
	set -l retc red
	test $status = 0; and set retc normal

	set -g VIRTUAL_ENV_DISABLE_PROMPT true
	set -q VIRTUAL_ENV; and echo -n (set_color white)'['(basename "$VIRTUAL_ENV")'] '

	echo -n (set_color cyan)$USER
	echo -n (set_color brblack)'@'
	echo -n (set_color brblue)(prompt_hostname)
	echo -n (set_color brblack)':'
	echo -n (set_color normal)(prompt_pwd -D 64)
	echo -n ' '

	set -l git_branch (git --no-optional-locks branch --show-current 2> /dev/null)
	if test -n "$git_branch"
		set -l git_status (git --no-optional-locks status --porcelain 2> /dev/null | tail -n 1)

		set -l git_branch_color brgreen
		test -n "$git_status"; and set git_branch_color bryellow

		echo -n "$(set_color $git_branch_color)‹"$git_branch"›"
	end

	set -q APHRODITE_THEME_SHOW_TIME; and echo -n "$(set_color brblack) [$(date +%H:%M:%S)]"

	echo  # new line

	set_color $retc
	if functions -q fish_is_root_user; and fish_is_root_user
		echo -n '# '
	else
		echo -n '$ '
	end

	set_color normal
end
