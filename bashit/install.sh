#!/usr/bin/env bash

# shortcut to this dotfiles path is $SH
[[ -d ~/.bash_it ]] || git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh --no-modify-config

export SH=$HOME/.dotfiles

# your project folder that we can `c [tab]` to
export PROJECTS=~/Projects

# Stash your environment variables in ~/.localrc. This means they'll stay out
# of your main dotfiles repository (which may be public, like this one), but
# you'll have access to them in your scripts.
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# load the path files
for file in $SH/**/*.sh
do
  if [[ $file != *"completion.sh" && $file != *"path.sh" $file != *"bashit/install.sh" ]]; then
    source $file
  fi
done

# load every completion after autocomplete loads
for file in $SH/**/*.sh
do
  if [[ $file == *"completion.sh" ]]; then
    source $file
  fi
done

unset config_files
