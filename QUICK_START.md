# Quick Start Guide

## 🚀 Get Running in 5 Minutes

### For Local Testing (Without Termux)

#### 1. Install Dependencies
```bash
cd ollama-chat-app
npm install
```

#### 2. Install Ollama (on your PC)
- Download from: https://ollama.ai
- Or use package manager:
  ```bash
  # macOS
  brew install ollama
  
  # Linux
  curl -fsSL https://ollama.ai/install.sh | sh
  
  # Windows
  # Download from ollama.ai
  ```

#### 3. Start Ollama
```bash
ollama serve

# In another terminal, download a model:
ollama pull mistral
```

#### 4. Start Chat App
```bash
cd ollama-chat-app
node server.js
```

#### 5. Open Browser
```
http://localhost:3000
```

---

## 📱 For Termux (Android)

### One-Command Install (Easiest)
```bash
curl -fsSL https://raw.githubusercontent.com/SoloFFFF77/ollama-chat-app/main/quick-install.sh | bash
```

### Manual Install
```bash
# Open Termux and run:
pkg update -y
pkg install nodejs
git clone https://github.com/SoloFFFF77/ollama-chat-app.git
cd ollama-chat-app
npm install

# Terminal 1: Start Ollama
ollama serve

# Terminal 2: Start Chat App
node server.js

# Open: http://localhost:3000
```

---

## 🎮 Testing the App

### Test Message
Try asking the AI:
```
"What is 2+2?"
"Tell me a joke"
"Explain quantum computing"
```

### Change Model
1. Click dropdown in sidebar
2. Select different model
3. Continue chatting

### Download Chat
1. Click "Download Chat" button
2. Conversation saved as JSON file

### Clear History
1. Click "Clear Chat" button
2. Confirm deletion
3. Start fresh

---

## 🔧 Troubleshooting

| Issue | Solution |
|-------|----------|
| Port 3000 already in use | `PORT=8080 node server.js` |
| Ollama not connecting | Make sure `ollama serve` is running |
| No models available | Run `ollama pull mistral` |
| Slow responses | Try smaller model: `ollama pull tinyllama` |
| Can't install npm packages | Run `npm install --verbose` to see errors |

---

## 📊 System Requirements

| Requirement | Minimum | Recommended |
|------------|---------|-------------|
| RAM | 2GB | 4GB+ |
| Storage | 1GB free | 8GB free |
| Processor | Any | Quad-core |
| Connection | None (offline) | - |

---

## 🎯 Next Steps

1. ✅ Get it running locally
2. 📤 Push to GitHub (see GITHUB_SETUP.md)
3. 🚀 Share with others
4. ⭐ Add features as needed

---

## 💡 Pro Tips

### Faster Startup
```bash
# Use TinyLlama (smaller, faster)
ollama pull tinyllama
# Select from dropdown in app
```

### Better Quality
```bash
# Use Dolphin Mixtral (highest quality)
ollama pull dolphin-mixtral
```

### Custom System Prompt Examples
```
"You are a Python expert. Answer only in Python code examples."

"You are a creative writer. Write engaging stories in 3-5 sentences."

"You are a helpful teacher. Explain concepts simply to beginners."

"You are a translator. Translate everything to Spanish. Provide English context."
```

### Keyboard Shortcuts
- `Enter` - Send message
- `Shift + Enter` - New line in chat

### Development Tips
- Edit `public/index.html` for UI changes
- Edit `server.js` for API changes
- Refresh browser to see UI changes (no restart needed)

---

## 📞 Getting Help

### Check These First
1. Is Ollama running? → `ollama serve`
2. Is port 3000 free? → `lsof -i :3000`
3. Is Node.js installed? → `node --version`
4. Can Ollama reach API? → Visit `http://localhost:11434`

### Debug Mode
```bash
# Run with verbose logging
DEBUG=* node server.js

# Monitor Ollama
ollama list  # See available models
ollama help  # See all commands
```

### Check Logs
```bash
# Node.js server logs
# Already printed to terminal

# Ollama logs (if running separately)
# Check /tmp/ollama.log or similar
```

---

## ✨ Features to Try

- ✅ **Real-time chat** - See responses as they're generated
- ✅ **Model switching** - Try different AI models
- ✅ **System prompts** - Customize AI behavior  
- ✅ **Chat history** - Download conversations
- ✅ **Mobile friendly** - Works on phones/tablets
- ✅ **Completely offline** - No internet needed

---

## 🎓 Learning Resources

### Ollama
- Docs: https://ollama.ai
- Models: https://ollama.ai/library
- GitHub: https://github.com/ollama/ollama

### Express.js
- Docs: https://expressjs.com
- Tutorials: https://developer.mozilla.org/

### Termux
- Official: https://termux.com
- Wiki: https://wiki.termux.com/wiki/Main_Page

---

## 📝 Common Questions

**Q: Can it work offline?**  
A: Yes! After downloading a model, everything is offline.

**Q: How much storage?**  
A: Models are 500MB-5GB each. Mistral is ~5GB.

**Q: Is my data private?**  
A: Yes! All data stays on your device.

**Q: Can I use it on multiple devices?**  
A: Each device needs its own Ollama installation.

**Q: How do I backup chats?**  
A: Use the "Download Chat" button to save as JSON.

---

**Ready? Let's go! 🚀**

Pick your platform:
- 🖥️ [Local Testing](#for-local-testing-without-termux)
- 📱 [Termux/Android](#-for-termux-android)

**Enjoy your local AI assistant!**
