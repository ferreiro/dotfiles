#!/usr/bin/env bash

# Some cool references places to find packages:
# http://www.hongkiat.com/blog/useful-atom-packages/
# https://atom.io/packages/

########################################################
#### Install Atom packages / modules and more stuff ####
########################################################

echo
echo "*******************************************************"
echo "*** Install Atom packages / modules and more stuff  ***"
echo "*******************************************************"
echo

#############
### TOOLS ###
#############

apm install pigments
apm install open-recent
apm install script # https://atom.io/packages/script
apm install linter # Install Linter using atom package manager: https://atom.io/packages/linter
apm install minimap # https://atom.io/packages/minimap
apm install atom-beautify # https://atom.io/packages/atom-beautify
apm install merge-conflicts # https://atom.io/packages/merge-conflicts
apm install highlight-selected # https://atom.io/packages/highlight-selected
apm install project-manager # https://atom.io/packages/project-manager
apm install tabs-to-spaces # https://atom.io/packages/tabs-to-spaces
apm install file-icons # https://atom.io/packages/file-icons
apm install emmet

###############
### LINTERS ###
###############
# More linters here: https://atom.io/users/AtomLinter/packages

# PYTHON
# Credits: http://www.marinamele.com/install-and-configure-atom-editor-for-python
pip install flake8
pip install flake8-docstrings
apm install linter-flake8
apm install atom-django

# RUBY
apm install linter-ruby

# JAVASCRIPT
apm install linter-jshint

# CSS
apm install linter-csslint
