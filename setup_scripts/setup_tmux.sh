#!/bin/bash

echo "=== Setting up Tmux ==="

# Update system and install Tmux.
echo "Installing Tmux..."
sudo apt-get update && sudo apt-get install tmux

# Install Tmux Plugin Manager.
echo "Installing Tmux Plugin Manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Copy the `.tmux.conf` file from this repo to the user home directory.
echo "Copying .tmux.conf to the home directory..."
cp ../tmux/.tmux.conf $HOME

echo "=== Finished running setup script for Tmux ==="
