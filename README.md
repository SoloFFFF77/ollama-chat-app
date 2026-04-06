# 🤖 Ollama Chat App

A modern, responsive, and completely offline AI chat application designed to run locally on your device, including Android phones via Termux. No cloud services, no API keys, and 100% privacy.

![Node.js Version](https://img.shields.io/badge/node-%3E%3D14.0.0-brightgreen)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Platform: Termux](https://img.shields.io/badge/Platform-Termux-blue)

## ✨ Features

- **Chat with AI Models:** Full integration with Ollama.
- **Switch Models Instantly:** Dropdown selection for your downloaded models.
- **Beautiful UI:** Modern dark theme, smooth animations, and mobile-friendly design.
- **100% Offline:** Once set up, no internet connection is required.
- **Real-time Streaming:** See responses as they are generated.
- **Production Ready:** Includes error handling, validation, and Docker support.

## 🚀 Quick Start (Termux)

If you're on an Android device using Termux, run the following command to install everything automatically:

```bash
curl -fsSL https://raw.githubusercontent.com/yourusername/ollama-chat-app/main/install-termux.sh | bash
```

After installation, start the services:

```bash
./start-all.sh
```

Then open your browser and navigate to: `http://localhost:3000`

## 💻 Local Installation (PC/Linux/Mac)

1. **Install Ollama:** Download and install from [ollama.ai](https://ollama.ai).
2. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/ollama-chat-app.git
   cd ollama-chat-app
   ```
3. **Install Dependencies:**
   ```bash
   npm install
   ```
4. **Start the Application:**
   ```bash
   npm start
   ```
5. **Open in Browser:** Navigate to `http://localhost:3000`.

## 🐳 Docker Deployment

For a containerized setup, ensure you have Docker and Docker Compose installed, then run:

```bash
docker-compose up -d
```

This will launch both the Ollama service and the chat application.

## 🛠️ Configuration

- **Port:** The default port is `3000`. You can change this by setting the `PORT` environment variable.
- **Ollama API:** The app connects to Ollama at `http://localhost:11434` by default.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Made with ❤️ for offline AI enthusiasts.
