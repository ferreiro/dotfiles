# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

##################################
######## INSTALL PROGRAMS ########
##################################

echo_warn "Installing fonts..."

mac_applications=(
    google-chrome
    opera
    firefox
    google-hangouts
    google-drive
    dash
    atom
    dropbox
    google-drive
    sublime-text3
    spotify
    skype
    mactracker
    imageoptim # image optimizer
    slack
    vlc
    flux
    macdown
    licecap # record screen and make gifs
    slate # snapshot
    cyberduck
    clamxav # antivirus
    spark # Shortcuts manager
    the-unarchiver
    dockertoolbox

    android-file-transfer
    glimmerblocker
    hammerspoon
    kaleidoscope
    screenflow
    sourcetree
    transmit
    virtualbox
    webstorm
)

brew cask install "${mac_applications[@]}"
