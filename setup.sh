#!/bin/bash

# 1. Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.shte)"

# 2. Install Mac App Store command line interface
brew install mas

# 3. Install basics tools from Brewfile
echo ""
echo "Installing basic tools"
echo ""
curl -fsSL https://raw.githubusercontent.com/team-chaos-it/chaos-setup-mac/main/basics.Brewfile | brew bundle --file=/dev/stdin

# 4. Install development tools from Brewfile
read -p "Do you want to install additional development tools? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo ""
    echo "Installing development tools"
    curl -fsSL https://raw.githubusercontent.com/team-chaos-it/chaos-setup-mac/main/development.Brewfile | brew bundle --file=/dev/stdin
fi

echo ""
echo ""
    
# 5. Install personal tools from Brewfile
read -p "\nDo you want to install additional personal tools from personal/$USER? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo ""
    echo "Installing personal tools"
    curl -fsSL "https://raw.githubusercontent.com/team-chaos-it/chaos-setup-mac/$USER/personal.Brewfile" | brew bundle --file=/dev/stdin
fi

# 6. Execute configuration script
sh ./configure.sh