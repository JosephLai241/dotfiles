#!/bin/bash

echo "=== Setting up Zsh ==="

# Install oh my zsh.
echo "=== Installing oh-my-zsh ==="
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone zsh-autosuggestions plugin.
echo "Cloning zsh-autosuggestions..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Clone zsh-syntax-highlighting plugin.
echo "Cloning zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Copy the `.zshrc` file from this repo to the user home directory.
echo "Copying .zshrc to the home directory..."
cp ../zsh/.zshrc $HOME

echo "=== Finished running setup script for Zsh ==="
