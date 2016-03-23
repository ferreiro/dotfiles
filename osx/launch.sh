### This script launch all the files inside osx.

echo
echo "********************"
echo "*** Mac Defaults ***"
echo "********************"
echo
echo "SETTING MAC Defaults..."
echo

for DEFAULTS_FILE in "$DOTFILES_DIR"/osx/defaults/*.sh; do
    echo "Applying $DEFAULTS_FILE" && . "$DEFAULTS_FILE"
done

echo "Done. Some changes may require a logout/restart to take effect."

#################################
### Setting dock applications ###
#################################

. "$DOTFILES_DIR/osx/dock.sh"

##################################
### Kill affected applications ###
##################################

for app in "Address Book" "Calendar" "Contacts" "Dock" "Finder" "Mail" "SystemUIServer" "iCal"; do
    killall "${app}" &> /dev/null
done

echo
echo "SETTED MAC DEFAULTS..."
echo
