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
    google-drive
    dropbox

    ### TEXT  EDITORS / IDES ###
    atom
    macdown
    sublime-text3
    webstorm # Javascript IDE

    ### DEVELOPMENT ###
    dash
    sourcetree # Git IDE
    dockertoolbox # https://www.docker.com/products/docker-toolbox
    zeplin
    mongohub

    ### CHATS ###
    skype
    slack
    telegram
    google-hangouts

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
    #easyfind # finder with steroids

)

brew cask install "${applications[@]}"

########################################################
### Launch the following applications to set them up ###
########################################################

applications_to_open=(
    flux # Setup day to wake up
    dropbox # Start Syncing files
    "Google chrome" # Setup google account
    "google drive" # Start Syncing files
    spotify # Connect account
    #imageoptim
    #licecap
)

for i in "${applications_to_open[@]}"
do
    echo "=> Opening:" $i
    open -a "$i"
done

echo ""
echo "INSTALLED MAC Applications..."
echo ""
