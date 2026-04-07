#!/bin/bash

# Colors for styling
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting Ollama Chat App in Background Mode...${NC}"

# Check for Termux Wake Lock
if command -v termux-wake-lock &> /dev/null; then
    echo -e "${YELLOW}🔹 Enabling Termux Wake Lock to prevent Android from sleeping...${NC}"
    termux-wake-lock
fi

# Start Ollama in background
if pgrep -f "ollama serve" > /dev/null; then
    echo -e "${GREEN}✅ Ollama is already running.${NC}"
else
    echo -e "${BLUE}🔹 Starting Ollama Service...${NC}"
    nohup ollama serve > /dev/null 2>&1 &
    disown
    sleep 5
fi

# Start Node server in background
if pgrep -f "node server.js" > /dev/null; then
    echo -e "${YELLOW}⚠️ Chat App is already running. Restarting...${NC}"
    pkill -f "node server.js"
    sleep 1
fi

echo -e "${BLUE}🔹 Starting Chat App on http://localhost:3000...${NC}"
nohup node server.js > server.log 2>&1 &
disown

echo -e "${GREEN}✅ Services are now running in the background!${NC}"
echo -e "${YELLOW}You can close Termux now, and the app will stay active.${NC}"
echo -e "${CYAN}To stop the services, use './manage.sh' and choose Stop.${NC}"
