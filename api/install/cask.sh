#!/bin/bash

echo
echo "**************************"
echo "*** Brew cask programs ***"
echo "**************************"
echo
echo "INSTALLING MAC Applications..."
echo

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

applications_to_install=(

    ### ESSENTIALS ###
    flux
    iterm2
    cleanmymac
    the-unarchiver # zips, rar, and more

    ### BROWSERS ###
    opera
    google-chrome
    google-chrome-canary
    firefoxdeveloperedition

    ### CLOUD / STORAGE ###
    dropbox
    google-drive

    ### TEXT  EDITORS / IDES ###
    atom
    macdown
    sublime-text3
    # webstorm # Javascript IDE

    ### DEVELOPMENT ###
    dash
    sourcetree # Git IDE
    # zeplin
    mongohub

    ### CHATS ###
    skype
    slack
    telegram
    # google-hangouts

    ### MULTIMEDIA ###
    vlc
    vox
    spotify
    slate # snapshot
    imageoptim # image optimizer
    licecap # record screen and make gif
    screenflow # Screen Recording
    licecap # animation screen
    pocketcast # podcasts

    ### OTHERS ###
    # mactracker
    # cyberduck # FTP
    # transmit # FTP. Paid application
    little-snitch # Network analyzer
    # hammerspoon # This is a tool for powerful automation of OS X
    # spark # Shortcuts manager
    android-file-transfer
    cheatsheet
    # virtualbox #  virtualization software
    # duet # Ipad to screen
    bitbar
    gpgtools # GPG Keychain and more GPG stuff
    sqlitestudio # See SQL squemas
    kindle
    send-to-kindle
    simpless
    #clamxav # antivirus
    #easyfind # finder with steroids
)

brew cask install "${applications_to_install[@]}"

########################################################
### Launch the following applications to set them up ###
########################################################

applications_to_open=(
    flux # Setup day to wake up
    dropbox # Start Syncing files
    spotify # Connect account
    "little-snitch"
    "Google chrome" # Setup google account
    "google drive" # Start Syncing files
)

for i in "${applications_to_open[@]}"
do
    echo "=> Opening:" $i
    open -a "$i"
done
