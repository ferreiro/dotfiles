###########################################
### Brew cask programs
###########################################

echo ""
echo "**************************"
echo "*** Brew cask programs ***"
echo "**************************"
echo ""

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

echo ""
echo "INSTALLING MAC Applications..."
echo ""

##########################################
### Install the following applications ###
##########################################

applications=(

    ### IMPRESCINDIBLES ###
    flux
    iterm2
    cleanmymac
    the-unarchiver # zips, rar, and more

    ### BROWSERS ###
    opera
    google-chrome
    firefoxdeveloperedition

    ### CLOUD / STORAGE ###
    google-drive
    dropbox

    ### TEXT  EDITORS / IDES ###
    atom
    macdown
    sublime-text3
    webstorm # Javascript IDE

    ### PROGRAMMING ###
    dash
    sourcetree # Git IDE
    dockertoolbox # https://www.docker.com/products/docker-toolbox

    ### CHATS ###
    skype
    slack
    google-hangouts

    ### MULTIMEDIA ###
    vlc
    vox
    spotify
    slate # snapshot
    imageoptim # image optimizer
    licecap # record screen and make gif
    screenflow # Screen Recording

    ### OTHERS ###
    mactracker
    cyberduck # FTP
    transmit # FTP. Paid application
    little-snitch # Network analyzer
    hammerspoon # This is a tool for powerful automation of OS X
    spark # Shortcuts manager
    android-file-transfer
    cheatsheet
    virtualbox #  virtualization software
    #clamxav # antivirus

)

brew cask install "${applications[@]}"

########################################################
### Launch the following applications to set them up ###
########################################################

applications_to_open=(
    flux
    dropbox
    "google drive"
    spotify
    imageoptim
)

for i in "${applications_to_open[@]}"
do
    echo "=> Opening:" $i
    open -a "$i"
done


echo ""
echo "INSTALLED MAC Applications..."
echo ""
