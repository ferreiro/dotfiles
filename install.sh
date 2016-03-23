#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###################################################
### Update repository and get current directory ###
###################################################

# Get current directory into a variable (so run this script from anywhere)

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

#  Update dotfiles itself first

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

#################################################
### Add Symbolic links to configuration files ###
#################################################

ln -sfv "$DOTFILES_DIR/config/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/config/git/.gitignore_global" ~

#####################################
### Install Programs and binaries ###
#####################################

. "$DOTFILES_DIR/install/brew/brew.sh"
. "$DOTFILES_DIR/install/brew/cask.sh"
. "$DOTFILES_DIR/install/brew/cask-fonts.sh"



##############################
### Configure GIST account ###
##############################

gist --login # https://github.com/defunkt/gist
