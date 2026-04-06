#!/bin/bash

echo "🚀 Starting Ollama Chat App Installation for Termux..."

# Update and upgrade packages
pkg update && pkg upgrade -y

# Install Node.js
pkg install nodejs -y

# Install dependencies
npm install

# Check if Ollama is installed
if ! command -v ollama &> /dev/null
then
    echo "📦 Installing Ollama..."
    # For Termux, we usually need the binary directly or via a specific repo
    # This is a placeholder for the actual Termux installation command
    # curl -L https://ollama.ai/download/ollama-linux-amd64 -o $PREFIX/bin/ollama
    # chmod +x $PREFIX/bin/ollama
    echo "Please ensure Ollama is installed for Termux."
fi

echo "✅ Installation complete!"
echo "Run './start-all.sh' to begin."
