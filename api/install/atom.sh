#!/bin/bash

echo
echo "*******************************************************"
echo "*** Install Atom packages / modules and more stuff  ***"
echo "*******************************************************"
echo

# Some cool references places to find packages:
# http://www.hongkiat.com/blog/useful-atom-packages/
# https://atom.io/packages/

brew cask install atom

# Setting requirements for Python Linter.
# Credits: http://www.marinamele.com/install-and-configure-atom-editor-for-python

pip install flake8
pip install flake8-docstrings

atom_packages=(

    ### TOOLS ###
    pigments # https://atom.io/packages/pigments
    open-recent # https://atom.io/packages/open-recent
    script # https://atom.io/packages/script
    linter # Install Linter using atom package manager: https://atom.io/packages/linter
    minimap # https://atom.io/packages/minimap
    atom-beautify # https://atom.io/packages/atom-beautify
    merge-conflicts # https://atom.io/packages/merge-conflicts
    highlight-selected # https://atom.io/packages/highlight-selected
    project-manager # https://atom.io/packages/project-manager
    tabs-to-spaces # https://atom.io/packages/tabs-to-spaces
    file-icons # https://atom.io/packages/file-icons
    emmet # https://atom.io/packages/emmet
    todo-show # https://atom.io/packages/todo-show
    language-jade # https://atom.io/packages/language-jade

    ### LINTERS ###
    # More linters here: https://atom.io/users/AtomLinter/packages
    # WARNING!!! Python linter needs flake8 $ pip install flake8 || $ pip install flake8-docstrings

    linter-flake8 # https://atom.io/packages/linter-flake8
    linter-ruby # https://atom.io/packages/linter-ruby
    linter-jshint # https://atom.io/packages/linter-jshint
    linter-csslint # https://atom.io/packages/linter-csslint
    atom-django # https://atom.io/packages/atom-django

    ### HANDLEBARS
    atom-handlebars

    ### JAVA
    autocomplete-java

    ### HASKELL
    language-haskell
    haskell-ghc-mod
    ide-haskell-cabal
    ide-haskell
    autocomplete-haskell
)

apm install "${atom_packages[@]}"
