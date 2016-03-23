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

ln -sfv "$DOTFILES_DIR/config/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/config/git/.gitignore_global" ~

#####################################
### Install Programs and binaries ###
#####################################

# . "$DOTFILES_DIR/install/brew/brew.sh"
# . "$DOTFILES_DIR/install/brew/cask.sh"
# . "$DOTFILES_DIR/install/brew/cask-fonts.sh"
. "$DOTFILES_DIR/install/app_store/install.sh"

#####################################
### SETING OSX: DEFAULTS AND DOCK ###
####################################

# Setting dock applications
. "$DOTFILES_DIR/osx/dock.sh"

for DEFAULTS_FILE in "$DOTFILES_DIR"/osx/defaults/*.sh; do
    echo "Applying $DEFAULTS_FILE" && . "$DEFAULTS_FILE"
done

echo "Done. Some changes may require a logout/restart to take effect."

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Address Book" "Calendar" "Contacts" "Dock" "Finder" "Mail" "SystemUIServer" "iCal"; do
    killall "${app}" &> /dev/null
done

# sub_osx () {
#     for DEFAULTS_FILE in "$DOTFILES_DIR"/osx/defaults*.sh; do
#         echo "Applying $DEFAULTS_FILE" && . "$DEFAULTS_FILE"
#     done
#     echo "Done. Some changes may require a logout/restart to take effect."
# }
#
# sub_osx ()

##############################
### Configure GIST account ###
##############################

#gist --login # https://github.com/defunkt/gist
