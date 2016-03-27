#!/bin/bash

EXECUTABLE_DIR="api"

cat $EXECUTABLE_DIR/assets/welcome.txt
cat $EXECUTABLE_DIR/assets/menu.txt

PS3='Number to execute: '
options=("Install" "Uninstall" "Update" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install")
            echo "Launching the installer..."
            . $EXECUTABLE_DIR/install.sh
            ;;
        "Uninstall")
            echo "Launching the uninstaller..."
            . $EXECUTABLE_DIR/uninstall.sh
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
