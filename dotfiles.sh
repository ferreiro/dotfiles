#!/bin/bash

cat $DOTFILES_DIR/assets/welcome.txt
cat $DOTFILES_DIR/assets/menu.txt

PS3='Which number you want to execute?: '
options=("Install" "Uninstall" "Update" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install")
            echo "Launching the installer..."
            . install.sh
            ;;
        "Uninstall")
            echo "Launching the uninstaller..."
            . uninstall.sh
            ;;
        "Update")
            echo "Updater is not currently supported"
            ;;
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
