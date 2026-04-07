# ⚡ Ollama Ultra-Pro Chat

A high-performance, professional-grade AI chat application powered by Ollama. Optimized for speed, privacy, and background stability on Termux and mobile devices.

![Node.js Version](https://img.shields.io/badge/node-%3E%3D14.0.0-brightgreen)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Platform: Termux](https://img.shields.io/badge/Platform-Termux-blue)

## ✨ Pro Features

- **🚀 Ultra-Fast Streaming:** Optimized Server-Sent Events (SSE) for near-instant response delivery.
- **🧠 Custom AI Behavior:** Set your own **System Prompt** to define the AI's personality and expertise.
- **🎙️ Voice-to-Text:** Integrated microphone support for hands-free interaction.
- **🖼️ Multimodal Vision:** Upload and analyze images using models like LLaVA.
- **📱 Background Stability:** Designed to keep generating responses even when you switch to your browser or other apps.
- **🎨 Modern UI:** Sleek, dark-themed interface with glassmorphism and responsive design.
- **📦 Model Manager:** Download and manage lightweight models (TinyLlama, Phi-3, etc.) directly from the UI.

## 🚀 Quick Start (Termux)

If you're on Android, use our one-command manager:

```bash
# Clone and enter the directory
git clone https://github.com/SoloFFFF77/ollama-chat-app.git
cd ollama-chat-app

# Run the manager
./manage.sh
```

Choose **Option 1** to start all services. The app will be available at `http://localhost:3000`.

## ⚙️ Configuration

### System Prompt
Access the **System Prompt** settings from the sidebar to give the AI specific instructions. Examples:
- "Act as a senior Python developer."
- "Explain everything like I'm five."
- "You are a creative writer who uses many metaphors."

### Background Mode
The server is configured with extended timeouts. If you switch to another app (like Chrome) while the AI is typing, it will continue to process. When you return to the chat, the response will be waiting for you.

## 💻 Local Installation (PC/Mac/Linux)

1. **Install Ollama:** [ollama.ai](https://ollama.ai)
2. **Clone & Install:**
   ```bash
   git clone https://github.com/SoloFFFF77/ollama-chat-app.git
   cd ollama-chat-app
   npm install
   ```
3. **Start:**
   ```bash
   node server.js
   ```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Made with ❤️ for the offline AI community.
