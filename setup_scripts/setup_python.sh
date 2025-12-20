#!/bin/bash

echo "=== Setting up Python ==="

echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "Verifying uv installation..."
which uv
uv --version

echo "Installing isort, Ruff, and pyright..."
uv tool install isort
uv tool install ruff
uv tool install pyright

echo "Verifying isort installation..."
which isort
isort --version

echo "Verifying Ruff installation..."
which ruff
ruff --version

echo "Verifying pyright installation..."
which pyright
pyright --version

echo "=== Finished running setup script for Python ==="
