#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install browsers
brew cask install brave-browser

# Set Brave as default browser
open -a "Brave Browser" --args --make-default-browser

# Install music apps
brew cask install spotify
brew cask install amazon-music

# Install productivity apps
brew cask install alfred
brew cask install notion

# Install developer tools
brew cask install intellij-idea
brew cask install arduino
brew cask install vs-code
brew cask install postman
brew cask install nosql-workbench
brew cask install wireshark
brew cask install docker
brew cask install rectangle
brew cask install alt-tab

# Install iTerm2
brew cask install iterm2

# Set iTerm2 as default terminal
defaults write com.apple.Terminal "Default Window Settings" "iTerm2"
defaults write com.apple.Terminal "Startup Window Settings" "iTerm2"

# Configure iTerm2 settings
osascript <<EOD
tell application "iTerm"
  tell current terminal
    set transparency to 0.9
    set style to full width bottom of screen
    set background color to "0 0 0"
    set blur radius to 12
    set use transparency to true
    set hotkey to {option, option}
    set hotkey window to floating window
    set animate showing and hiding to true
  end tell
end tell
EOD

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set Zsh as default shell
chsh -s /bin/zsh

# Add git plugin and set theme to 'agnoster'
sed -i -e 's/robbyrussell/agnoster/' ~/.zshrc
sed -i -e 's/plugins=(git)/plugins=(git)/' ~/.zshrc

# Reload Zsh configuration
source ~/.zshrc

echo "Done."
