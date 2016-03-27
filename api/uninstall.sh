#!/bin/bash

# Get dotfiles directory to (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update the user's cached credentials, authenticating the user if necessary.
# keep-alive to update existing `sudo` time stamp until script has finished.

clear

echo "Welcome to the uninstaller!"
echo "First, introduce your password to execute all the dotfiles as super user"
echo "Note: You can be asked more times for password during process"
echo

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
clear # clear the screen


#########################
### UNFINISH FUNCTION ###
#########################

echo "Warning! Uninstall is not finished chet and may produce some undesired actions"
echo "Please. Don't run this script unless you're sure."

read -p "Are you sure? [y/N]: " -n 1 -r
echo    # (optional) move to a new line

if [[ $REPLY =~ ^[Nn]$ ]]
then
  exit 0
fi

####################################################
### Remove Symbolic links to configuration files ###
####################################################

echo
echo "=> Unmount all symbolic links"
echo

unmount_symbolic_links () {
  unlink ~/.bash_profile
  unlink ~/.inputrc
  unlink ~/.gitconfig
  unlink ~/.gitignore_global
  unlink ~/.gemrc
  unlink ~/.atom
  echo "   [UNMOUNTED] All symbolic links were deleted"
}

unmount_symbolic_links # call function

# Restore all mac defaults

echo
echo "=> Erase Mac OSX Defaults:"
echo

# defaults_list=(
#   Dock
#   Finder
#   #TODO: You need to include more defaults here. or find a way to delete all at onces
#   #"Address Book"
#   #Calendar
#   #Contacts
#   #Mail
# )
# defaults delete com.apple."${defaults_list[@]}";

echo "   [DELETED] All defaults were deleted"


### Uninstall brew formulas ###

echo
echo "=> Erase Homebrew formulas:"
echo

total_formulas="$(brew list)"

if [ ! -n "$total_formulas" ]
then
  echo "   [EMPTY] The are not any brew formulas to be erased"
else
  echo "   [YES] The are some brew formulas installed"
  echo "         Erasing brew formulas"
  echo
  brew list | xargs brew uninstall --force
fi

### Uninstall brew formulas ###

echo
echo "=> Erase Homebrew cask applications:"
echo

total_cask_apps="$(brew cask list)"

if [ ! -n "$total_cask_apps" ]
then
  echo "   [EMPTY] The are not any brew cask applications to be erased"
else
  echo "   [YES] The are some brew cask applications"
  echo "         Erasing brew cask applications"

  brew cask list | xargs brew cask uninstall --force
fi

### Kill all to apply changes ###
killall Dock

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

exit 1
