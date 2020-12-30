#!/usr/bin/env bash

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# Path to the bash it configuration
export BASH_IT="/home/martin/.bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME='nwinkler'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source "$BASH_IT"/bash_it.sh

export HISTFILESIZE=
export HISTSIZE=2000
# Don't remember trivial 1- and 2-letter commands.
export HISTIGNORE=?:??
# What it says.
export HISTCONTROL=ignoredups

# Append to ~/.bash_history instead of overwriting it -- this stops terminals
# from overwriting one another's histories.
shopt -s histappend

# Save each history entry immediately (protects against terminal crashes/
# disconnections, and interleaves commands from multiple terminals in correct
# chronological order).
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"