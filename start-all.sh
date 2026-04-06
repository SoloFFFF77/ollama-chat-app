#!/bin/bash

# Function to stop all background processes on exit
cleanup() {
    echo "🛑 Stopping services..."
    kill $OLLAMA_PID $CHAT_PID 2>/dev/null
    exit
}

trap cleanup SIGINT SIGTERM

echo "🚀 Starting Ollama Chat App Services..."

# Start Ollama service in background
if command -v ollama &> /dev/null; then
    echo "🔹 Starting Ollama..."
    ollama serve > /dev/null 2>&1 &
    OLLAMA_PID=$!
    sleep 5 # Wait for Ollama to initialize
else
    echo "⚠️ Ollama command not found. Please install it first."
fi

# Start Chat App
echo "🔹 Starting Chat App on http://localhost:3000..."
npm start &
CHAT_PID=$!

echo "✅ All services are running!"
echo "Press Ctrl+C to stop everything."

# Keep the script running
wait
