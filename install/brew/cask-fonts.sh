###########################################
### Brew cask fonts
###########################################

echo_warn "Brew cask fonts"
echo_warn "[ INSTALLING ] System fonts..."

brew tap caskroom/fonts

fonts=(
    font-anonymous-pro
    font-dejavu-sans-mono-for-powerline
    font-droid-sans
    font-droid-sans-mono font-droid-sans-mono-for-powerline
    font-meslo-lg font-input
    font-inconsolata font-inconsolata-for-powerline
    font-liberation-sans
    font-meslo-lg
    font-nixie-one
    font-office-code-pro
    font-roboto
    font-roboto-slab
    font-source-sans-pro
    font-ubuntu font-ubuntu-mono-powerline
    font-fira-code
    font-fira-mono-for-powerline
    font-fira-mono
    font-fira-sans
    font-open-sans
    font-pt-sans
    font-pt-serif
    font-roboto
    font-source-sans-pro
    font-source-serif-pro
)

# DEBUG
# brew cask install "${fonts[@]}"
echo_warn "[ INSTALLED ] System fonts..."
