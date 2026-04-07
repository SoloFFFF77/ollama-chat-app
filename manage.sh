#!/bin/bash

# Colors for styling
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ASCII Art for Header
show_header() {
    clear
    echo -e "${BLUE}"
    echo "  ██████╗ ██╗     ██╗      █████╗ ███╗   ███╗ █████╗     ██████╗██╗  ██╗ █████╗ ████████╗"
    echo " ██╔═══██╗██║     ██║     ██╔══██╗████╗ ████║██╔══██╗   ██╔════╝██║  ██║██╔══██╗╚══██╔══╝"
    echo " ██║   ██║██║     ██║     ███████║██╔████╔██║███████║   ██║     ███████║███████║   ██║   "
    echo " ██║   ██║██║     ██║     ██╔══██║██║╚██╔╝██║██╔══██║   ██║     ██╔══██║██╔══██║   ██║   "
    echo " ╚██████╔╝███████╗███████╗██║  ██║██║ ╚═╝ ██║██║  ██║   ╚██████╗██║  ██║██║  ██║   ██║   "
    echo "  ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝    ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   "
    echo -e "${CYAN}                            - Termux AI Manager v1.0 -${NC}"
    echo ""
}

# Function to stop all background processes
stop_all() {
    echo -e "${RED}🛑 Stopping all services...${NC}"
    pkill -f "ollama serve"
    pkill -f "node server.js"
    echo -e "${GREEN}✅ All services stopped.${NC}"
    sleep 2
}

# Function to start everything
start_all() {
    echo -e "${CYAN}🚀 Starting Ollama Chat App Services...${NC}"
    
    # Start Ollama
    if command -v ollama &> /dev/null; then
        echo -e "${BLUE}🔹 Starting Ollama...${NC}"
        ollama serve > /dev/null 2>&1 &
        sleep 5
    else
        echo -e "${RED}⚠️ Ollama not found. Please install it first.${NC}"
    fi

    # Start Node server
    echo -e "${BLUE}🔹 Starting Node.js Server on http://localhost:3000...${NC}"
    node server.js &
    
    echo -e "${GREEN}✅ All services are running!${NC}"
    echo -e "${YELLOW}Press Enter to return to menu.${NC}"
    read
}

# Function to install models
install_model() {
    echo -e "${CYAN}📦 Select a model to install:${NC}"
    echo "1) TinyLlama (637MB - Recommended for Termux)"
    echo "2) Phi-3 Mini (2.3GB - High Quality)"
    echo "3) Gemma 2B (1.4GB - Fast & Smart)"
    echo "4) LLaVA (4.7GB - Supports Images)"
    echo "5) Custom Model (Enter name)"
    echo "6) Back to Menu"
    read -p "Enter choice [1-6]: " mchoice

    case $mchoice in
        1) ollama pull tinyllama ;;
        2) ollama pull phi3 ;;
        3) ollama pull gemma:2b ;;
        4) ollama pull llava ;;
        5) read -p "Enter model name: " custom_m; ollama pull $custom_m ;;
        6) return ;;
        *) echo -e "${RED}Invalid choice.${NC}" ;;
    esac
    echo -e "${GREEN}✅ Done! Press Enter to return.${NC}"
    read
}

# Main Menu Loop
while true; do
    show_header
    echo -e "${YELLOW}--- MAIN MENU ---${NC}"
    echo -e "${GREEN}1)${NC} Start All Services (Ollama + App)"
    echo -e "${GREEN}2)${NC} Start in Background (Keep Running)"
    echo -e "${GREEN}3)${NC} Stop All Services"
    echo -e "${GREEN}4)${NC} Install/Pull New Model"
    echo -e "${GREEN}5)${NC} Check Installed Models"
    echo -e "${GREEN}6)${NC} Run Full Installer (Termux Setup)"
    echo -e "${RED}7)${NC} Exit"
    echo ""
    read -p "Enter your choice [1-6]: " choice

    case $choice in
        1) start_all ;;
        2) bash background-run.sh; echo -e "${YELLOW}Press Enter to return.${NC}"; read ;;
        3) stop_all ;;
        4) install_model ;;
        5) ollama list; echo -e "${YELLOW}Press Enter to return.${NC}"; read ;;
        6) bash install-termux.sh; echo -e "${YELLOW}Press Enter to return.${NC}"; read ;;
        7) stop_all; exit 0 ;;
        *) echo -e "${RED}Invalid choice.${NC}"; sleep 1 ;;
    esac
done
