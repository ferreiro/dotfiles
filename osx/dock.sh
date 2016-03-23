#!/bin/sh
# Source: https://github.com/webpro/dotfiles/blob/c55045c692088105dce3545637d8ab80f120908f/osx/dock.sh

# dockutil --no-restart --remove all
# dockutil --no-restart --add "$HOME/Applications/Wunderlist.app"
# dockutil --no-restart --add "/Applications/Calendar.app"
# dockutil --no-restart --add "/Applications/Airmail 2.app"
# dockutil --no-restart --add "$HOME/Applications/Google Chrome.app"
# dockutil --no-restart --add "$HOME/Applications/FirefoxDeveloperEdition.app"
# dockutil --no-restart --add "$HOME/Applications/Atom.app"
# dockutil --no-restart --add "$HOME/Applications/Iterm2.app"
# dockutil --no-restart --add "/Applications/System Preferences.app"
#
# killall Dock

dockutil --no-restart --remove all
dockutil --no-restart --add "$HOME/Applications/Google Chrome.app"
dockutil --no-restart --add "$HOME/Applications/Firefox.app"
dockutil --no-restart --add "/Applications/Safari.app"
dockutil --no-restart --add "/Applications/Mail.app"
dockutil --no-restart --add "/Applications/Calendar.app"
dockutil --no-restart --add "/Applications/Utilities/Terminal.app"
dockutil --no-restart --add "/Applications/System Preferences.app"
dockutil --no-restart --add "/Applications/Utilities/Console.app"
dockutil --no-restart --add "$HOME/Applications/Spotify.app"

killall Dock
