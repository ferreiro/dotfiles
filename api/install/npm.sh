#!/bin/bash

echo
echo "*******************************************************"
echo "*** Install NPM packages / modules and more stuff  ***"
echo "*******************************************************"
echo

npm_packages=(
  express-generator
  coffee-script
  azure-cli
  bower
  gulp
)

npm install -g "${npm_packages[@]}"
