#!/usr/bin/env bash

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
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

ln -sfv "$DOTFILES_DIR/config/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/config/.inputrc" ~
ln -sfv "$DOTFILES_DIR/config/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/config/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/config/.atom" ~
ln -sfv "$DOTFILES_DIR/runcom/.gemrc" ~

#####################################
### Install Programs and binaries ###
#####################################

. "$DOTFILES_DIR/install/brew/brew.sh" # This must be go first here
. "$DOTFILES_DIR/install/brew/cask.sh"
. "$DOTFILES_DIR/install/brew/cask-fonts.sh"
. "$DOTFILES_DIR/install/app_store/install.sh"
. "$DOTFILES_DIR/install/atom.sh"
. "$DOTFILES_DIR/install/bash.sh"

#####################################
### SETING OSX: DEFAULTS AND DOCK ###
####################################

. "$DOTFILES_DIR/osx/launch.sh"

##############################
### Configure GIST account ###
##############################

. "$DOTFILES_DIR/install/gist.sh"
