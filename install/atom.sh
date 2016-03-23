#!/usr/bin/env bash

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
apm install highlight-selected
apm install open-recent
apm install linter # Install Linter using atom package manager: https://atom.io/packages/linter
apm install minimap # https://atom.io/packages/minimap
apm install atom-beautify # https://atom.io/packages/atom-beautify
apm install merge-conflicts # https://atom.io/packages/merge-conflicts

###############
### LINTERS ###
###############
# More linters here: https://atom.io/users/AtomLinter/packages

# PYTHON
# Credits: http://www.marinamele.com/install-and-configure-atom-editor-for-python
pip install flake8
pip install flake8-docstrings
apm install linter-flake8

# RUBY
apm install linter-ruby

# JAVASCRIPT
apm install linter-jshint

# CSS
apm install linter-csslint
