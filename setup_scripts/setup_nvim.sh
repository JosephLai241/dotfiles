#!/bin/bash

NEOVIM_TARBALL="nvim-linux-x86_64.tar.gz"
NEOVIM_DOWNLOAD_URL="https://github.com/neovim/neovim/releases/download/v0.11.5/${NEOVIM_TARBALL}"

BIN_SYMLINK="/usr/local/bin/nvim"
INSTALL_DIR="/opt/neovim"

echo "=== Setting up Neovim ==="

# Update system and install ripgrep and fd.
echo "Installing ripgrep and fd..."
sudo apt-get update && sudo apt-get install ripgrep fd-find bat

# Download Neovim.
echo "Downloading Neovim..."
curl -L "$NEOVIM_DOWNLOAD_URL" -o /tmp

# Extract the tarball.
echo "Extracting tarball..."
sudo mkdir -p "$INSTALL_DIR"
sudo tar -C "$INSTALL_DIR" --strip-components=1 -xzf /tmp/${NEOVIM_TARBALL}

# Create a symlink to the binary.
echo "Creating symlink at ${BIN_SYMLINK}..."
sudo ln -sf ${INSTALL_DIR}/bin/nvim $BIN_SYMLINK

# Clean up the /tmp directory.
echo "Cleaning up the /tmp directory..."
rm /tmp/${NEOVIM_TARBALL}

# Verify Neovim installation.
echo "Verifying installation..."
which nvim
nvim --version | head -n 1

# Copy Neovim Lua configuration files to the ~/.config directory.
echo "Copying Lua configuration files to ~/.config directory..."
cp -R ../nvim/ $HOME/.config/nvim/

echo "=== Finished running setup script for Neovim ==="
