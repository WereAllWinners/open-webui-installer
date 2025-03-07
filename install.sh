#!/bin/bash

# Update and upgrade Ubuntu
echo "Updating and upgrading Ubuntu..."
sudo apt-get update && sudo apt-get upgrade -y

# Check if Python3 is installed
if ! python3 --version &> /dev/null; then
    echo "Python3 is not installed. Installing Python3..."
    sudo apt-get install -y python3
fi

# Ensure pip is installed and upgraded
echo "Ensuring pip is installed and upgraded..."
sudo apt-get install -y python3-pip
# python3 -m pip install --upgrade pip # Comment out this line to avoid the externally-managed-environment error

# Install pipx
echo "Installing pipx..."
sudo apt-get install -y pipx

# Ensure pipx is on the PATH
export PATH="$HOME/.local/bin:$PATH"

# Install Ollama application
echo "Installing Ollama application..."
curl -fsSL https://ollama.com/install.sh | sh

echo "Please start the Ollama app manually by running 'ollama' in a separate terminal."
read -p "Press Enter after starting the Ollama app..."

# Install Ollama models
echo "Installing Ollama models..."
ollama run mistral & sleep 5 && echo "/bye" | ollama
ollama run phi4 & sleep 5 && echo "/bye" | ollama
ollama run llama3.2 & sleep 5 && echo "/bye" | ollama
ollama run codegemma & sleep 5 && echo "/bye" | ollama

# Install open-webui using pipx
echo "Installing open-webui..."
pipx install open-webui

echo "Installation complete."