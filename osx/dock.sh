#!/bin/sh
# Source: https://github.com/webpro/dotfiles/blob/c55045c692088105dce3545637d8ab80f120908f/osx/dock.sh

dockutil --no-restart --remove all
dockutil --no-restart --add "$HOME/Applications/Wunderlist.app"
dockutil --no-restart --add "/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Airmail 2.app"
dockutil --no-restart --add "$HOME/Applications/Google Chrome.app"
dockutil --no-restart --add "$HOME/Applications/FirefoxDeveloperEdition.app"
dockutil --no-restart --add "$HOME/Applications/Atom.app"
dockutil --no-restart --add "$HOME/Applications/iterm2/iTerm.app"

# Add space to System configuration
# defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'

#Add a spacer to the left side of the Dock (where the applications are)
defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
#Add a spacer to the right side of the Dock (where the Trash is)
defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'


dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
