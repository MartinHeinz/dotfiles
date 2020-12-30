#!/usr/bin/env bash

echo "Setting up apps..."

common=(
  git
  curl
  jq
  vim
  wget
  net-tools
)

ubuntu=(
  apache2-utils
  filezilla
  shutter
)

rhel=(
  pinfo
)

# User has to be _sudoer_
export DISTRO=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
if [ "$DISTRO" = "Ubuntu" ]; then
  echo "Installing apps with apt"
  sudo apt install ${common[@]} -y
  sudo apt install ${ubuntu[@]} -y
else
  echo "Installing apps with yum"
  sudo yum install ${common[@]} -y
  sudo yum install ${rhel[@]} -y
fi
