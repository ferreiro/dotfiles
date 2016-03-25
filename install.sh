#!/usr/bin/env bash

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################
#### Install Homebrew and git at beginning ####
###############################################

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update # Make sure we’re using the latest Homebrew.
brew upgrade --all # Upgrade any already-installed formulae.
brew upgrade

brew install git # Install GIT in order to "update" the repository below

#################################################################################
### put current directory into  a variable (so run this script from anywhere) ###
#################################################################################

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

#####################################################
### Update dotfiles itself first using git remote ###
#####################################################

[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

#################################################
### Add Symbolic links to configuration files ###
#################################################
# Great explanation of symbolic links: https://gigaom.com/2011/04/27/how-to-create-and-use-symlinks-on-a-mac/

mount_symbolic_links () {
  ln -sfv "$DOTFILES_DIR/config/.bash_profile" ~
  ln -sfv "$DOTFILES_DIR/config/.inputrc" ~
  ln -sfv "$DOTFILES_DIR/config/git/.gitconfig" ~
  ln -sfv "$DOTFILES_DIR/config/git/.gitignore_global" ~
  ln -sfv "$DOTFILES_DIR/runcom/.gemrc" ~
  rm -rf  "$HOME/.atom" # Remove atom configuration folder before loading the new ones
  ln -sfv "$DOTFILES_DIR/config/.atom" ~
}

mount_symbolic_links

#####################################
### Install Programs and binaries ###
#####################################

. "$DOTFILES_DIR/install/brew/formulas.sh" # This must be go first here
. "$DOTFILES_DIR/install/brew/cask.sh"
. "$DOTFILES_DIR/install/brew/cask-fonts.sh"
. "$DOTFILES_DIR/install/app_store/install.sh"
. "$DOTFILES_DIR/install/atom.sh"
. "$DOTFILES_DIR/install/bash.sh"

#####################################
### SETING OSX: DEFAULTS AND DOCK ###
####################################

. "$DOTFILES_DIR/osx/launch.sh"

###@##################
### SET UP FOLDERS ###
###@##################

. "$DOTFILES_DIR/setup/my_documents.sh"
. "$DOTFILES_DIR/setup/backup_gdrive.sh" # backup google drive folders into dropbox

##############################
### Configure GIST account ###
##############################

. "$DOTFILES_DIR/install/gist.sh"

exit 1
