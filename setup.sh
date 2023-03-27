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
brew install --cask brave-browser

# Set Brave as default browser
open -a "Brave Browser" --args --make-default-browser

# Install music apps
echo "Installing Spotify..."
brew install --cask spotify
echo "Installing Amazon Music..."
brew install --cask amazon-music

# Install productivity apps
echo "Installing Alfred..."
brew install --cask alfred
echo "Installing Notion..."
brew install --cask notion

# Install developer tools
echo "Installing Intellij..."
brew install --cask intellij-idea-ce
echo "Installing Arduino..."
brew install --cask arduino
echo "Installing VSCode..."
brew install --cask vs-code
echo "Installing Postman..."
brew install --cask postman
echo "Installing NoSQL Workbench..."
brew install --cask nosql-workbench
echo "Installing Wireshark..."
brew install --cask wireshark
echo "Installing Docker..."
brew install --cask docker
echo "Installing Rectangle..."
brew install --cask rectangle
echo "Installing AltTab..."
brew install --cask alt-tab
echo "Installing Python..."
brew install python@3.9
echo "Installing Java..."
brew install jenv
echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(jenv init -)"' >> ~/.zshrc
source ~/.zshrc
brew install openjdk@17
sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
jenv add "$(/usr/libexec/java_home)"
jenv global 17.0


# Install iTerm2
echo "Installing iTerm2..."
brew install --cask iterm2

# Set iTerm2 as default terminal
echo "Setting iTerm2 as default..."
defaults write com.apple.Terminal "Default Window Settings" "iTerm2"
defaults write com.apple.Terminal "Startup Window Settings" "iTerm2"

# Configure iTerm2 settings
# Missing how to configure this
# osascript <<EOD
# tell application "iTerm"
#   tell current terminal
#     set transparency to 0.9
#     set style to full width bottom of screen
#     set background color to "0 0 0"
#     set blur radius to 12
#     set use transparency to true
#     set hotkey to {option, option}
#     set hotkey window to floating window
#     set animate showing and hiding to true
#   end tell
# end tell
# EOD

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
