#!/bin/bash

# Install Homebrew (if not already installed)
if ! command -v brew &> /dev/null
then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Homebrew installed!"
fi

# Add Homebrew to system PATH
echo "Adding Homebrew to PATH..."
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# Install browsers
echo "Installing Brave Browser..."
brew cask install brave-browser

# Set Brave as default browser
open -a "Brave Browser" --args --make-default-browser

# Install music apps
echo "Installing Spotify..."
brew cask install spotify
echo "Installing Amazon Music..."
brew cask install amazon-music

# Install productivity apps
echo "Installing Alfred..."
brew cask install alfred
echo "Installing Notion..."
brew cask install notion

# Install developer tools
echo "Installing Intellij..."
brew cask install intellij-idea
echo "Installing Arduino..."
brew cask install arduino
echo "Installing VSCode..."
brew cask install vs-code
echo "Installing Postman..."
brew cask install postman
echo "Installing NoSQL Workbench..."
brew cask install nosql-workbench
echo "Installing Wireshark..."
brew cask install wireshark
echo "Installing Docker..."
brew cask install docker
echo "Installing Rectangle..."
brew cask install rectangle
echo "Installing AltTab..."
brew cask install alt-tab

# Install iTerm2
echo "Installing iTerm2..."
brew cask install iterm2

# Set iTerm2 as default terminal
echo "Setting iTerm2 as default..."
defaults write com.apple.Terminal "Default Window Settings" "iTerm2"
defaults write com.apple.Terminal "Startup Window Settings" "iTerm2"

# Configure iTerm2 settings
echo "Configuring iTerm2..."
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
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set Zsh as default shell
echo "Configuring Oh My Zsh ..."
chsh -s /bin/zsh

# Add git plugin and set theme to 'agnoster'
sed -i -e 's/robbyrussell/agnoster/' ~/.zshrc
sed -i -e 's/plugins=(git)/plugins=(git)/' ~/.zshrc

# Reload Zsh configuration
source ~/.zshrc

echo "Done."
