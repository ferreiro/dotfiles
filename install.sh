#!/bin/bash

# Get dotfiles directory to (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update the user's cached credentials, authenticating the user if necessary.
# keep-alive to update existing `sudo` time stamp until script has finished.

clear

echo "Welcome to the installer!"
echo "First, introduce your password to execute all the dotfiles as super user"
echo "Note: You can be asked more times for password during process"
echo

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
clear # clear the screen

###################################################
### Install programs needed to execute dotfiles ###
###################################################

install_setup() {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install git
}

update_homebrew() {
  brew update # Make sure we’re using the latest Homebrew.
  brew upgrade --all # Upgrade any already-installed formulae.
  brew upgrade
}

update_dotiles() {
  [ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master
}

echo "=> Install Homebrew, Git and tools we need for running dotfiles."
install_setup

echo "=> Update Homebrew formulas"
update_homebrew

echo "=> Update Dotfiles repository itself."
#update_dotiles

clear # clear the screen

#################################################
### Add Symbolic links to configuration files ###
#################################################
# Symbolic links explained here: https://goo.gl/phYxzR

add_config_symbolic_links () {
  rm -rf  "$HOME/.atom" # Remove atom configuration folder before loading the new ones
  ln -sfv "$DOTFILES_DIR/config/.atom" ~
  ln -sfv "$DOTFILES_DIR/config/.gemrc" ~
  ln -sfv "$DOTFILES_DIR/config/.inputrc" ~
  ln -sfv "$DOTFILES_DIR/config/.bash_profile" ~
  ln -sfv "$DOTFILES_DIR/config/git/.gitconfig" ~
  ln -sfv "$DOTFILES_DIR/config/git/.gitignore_global" ~
}

read -p "=> Do you want to add symbolic links? [y/n]: "
if [ "$REPLY" == "y" ]; then
  clear # clear the screen
  add_config_symbolic_links
fi

#####################################
### Install Programs and binaries ###
#####################################

read -p "=> Do you want to install all your scripts inside $DOTFILES_DIR/install? [y/n]: "
if [ "$REPLY" == "y" ]; then

  # installation_files=(
  #   osx/launch.sh
  #   install/formulas.sh
  #   install/applications.sh
  #   install/atom.sh
  #   install/bash.sh
  #   install/fonts.sh
  #   install/gist.sh
  #   install/npm.sh
  # )

  clear # clear the screen

  for INSTALLFILE in "$DOTFILES_DIR"/install/*.sh; do
      [ -f "$INSTALLFILE" ] && . "$INSTALLFILE"
  done

  # for install_directory in "${installation_files[@]}"
  # do
  #     echo "=> Installing all scripts from directory:" $install_directory
  #     . $DOTFILES_DIR/$install_directory # Execute script
  # done

fi

######################
### SET UP FOLDERS ###
#####################

echo
read -p "=> Do you want to create symbolic links to Google Drive? [y/n]: "
if [ "$REPLY" == "y" ]; then
  clear # clear the screen
  . "$DOTFILES_DIR/system/documents.sh"
  . "$DOTFILES_DIR/system/backup_gdrive.sh" # backup google drive folders into dropbox
fi

cat $DOTFILES_DIR/assets/congratulations.txt
exit 1
