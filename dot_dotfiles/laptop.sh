#!/usr/bin/env bash

#Stops script if there is an error
set -e

info_echo "Installing or updating chezmoi ..."
brew bundle --file=- <<EOF
    brew 'chezmoi'
EOF

if [ ! -f "$HOME/.config/chezmoi/chezmoi.toml" ]; then
	info_echo "Applying dotfiles with chezmoi ..."
	chezmoi init --apply --verbose https://github.com/ibll/dotfiles.git
	chmod 0600 "$HOME/.config/chezmoi/chezmoi.toml"
fi

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

#        App        #
#                   #
#       iTerm       #

# Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/System/iTerm/Settings"

# Tell iTerm to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

# Install iTerm custom theme
open "${HOME}/.dotfiles/System/iTerm/Lovelace_Trans_Dark.itermcolors"
