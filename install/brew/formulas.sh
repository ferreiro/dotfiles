#!/usr/bin/env bash

brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery

brew install coreutils # Install GNU core utilities (those that come with OS X are outdated).
# sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install moreutils # Install some other useful utilities like `sponge`.
brew install findutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install gnu-sed --with-default-names # Install GNU `sed`, overwriting the built-in `sed`.

###########################################################
####  Install more recent versions of some OS X tools. ####
###########################################################

brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php56 --with-gmp

#########################################
#### Tools and programming languages ####
#########################################

binaries=(

    ### TOOLS ###
    vim
    git
    gist # https://github.com/defunkt/gist
    git-lfs
    cmake
    dockutil # Add/remove dock icons
    bash-completion
    bash-completion2
    diff-so-fancy # used on .gitconfig [pager]
    wget
    tree
    dark-mode # Set dark mode
    fasd # Productivity for the command line >> https://github.com/clvv/fasd#install
    nvm # Node Version Manager - Simple bash script to manage multiple active node.js versions

    ### DATABASES ###
    redis
    mongodb
    postgresql
    apache-spark

    ### LANGUAGES ###
    go
    ruby
    node
    python
    python3
)

brew install "${binaries[@]}"
brew cleanup # Remove outdated versions from the cellar.

# Put dark Mode
# force a specific mode
dark-mode --mode Dark


# # Install Bash 4.
# # Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# # running `chsh`.
# brew install bash
# brew tap homebrew/versions
# brew install bash-completion2
#
# # Install `wget` with IRI support.
# brew install wget --with-iri
#
# # Install RingoJS and Narwhal.
# # Note that the order in which these are installed is important;
# # see http://git.io/brew-narwhal-ringo.
# brew install ringojs
# brew install narwhal
#
# # Install more recent versions of some OS X tools.
# brew install vim --override-system-vi
# brew install homebrew/dupes/grep
# brew install homebrew/dupes/openssh
# brew install homebrew/dupes/screen
# brew install homebrew/php/php56 --with-gmp
#
# # Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2
#
# # Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz
#
# # Install other useful binaries.
# brew install ack
# brew install dark-mode
# #brew install exiv2
# brew install git
# brew install git-lfs
# brew install imagemagick --with-webp
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rhino
# brew install speedtest_cli
# brew install ssh-copy-id
# brew install testssl
# brew install tree
# brew install webkit2png
# brew install zopfli
#
