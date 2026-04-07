const express = require('express');
const axios = require('axios');
const cors = require('cors');
const path = require('path');
const http = require('http');

const app = express();
const server = http.createServer(app);
const PORT = process.env.PORT || 3000;
const OLLAMA_URL = 'http://localhost:11434/api/generate';

app.use(cors());
app.use(express.json({ limit: '100mb' }));
app.use(express.static(path.join(__dirname, 'public')));

// Set high timeout for background stability
server.keepAliveTimeout = 120000; // 120 seconds
server.headersTimeout = 125000;

app.post('/api/chat', async (req, res) => {
    const { model, prompt, images, context, system } = req.body;

    try {
        const payload = {
            model: model || 'mistral',
            prompt: prompt,
            stream: true,
            system: system || "You are a helpful AI assistant.",
            options: {
                num_predict: 2048,
                temperature: 0.7,
                top_p: 0.9,
                repeat_penalty: 1.1,
                num_ctx: 4096, // Optimized context window
            }
        };

        if (images && images.length > 0) {
            payload.images = images;
        }
        
        if (context) {
            payload.context = context;
        }

        const response = await axios.post(OLLAMA_URL, payload, { 
            responseType: 'stream',
            timeout: 0 
        });

        // Use standard SSE headers for maximum compatibility and speed
        res.writeHead(200, {
            'Content-Type': 'text/event-stream',
            'Cache-Control': 'no-cache, no-transform',
            'Connection': 'keep-alive',
            'X-Accel-Buffering': 'no' // Disable buffering for Nginx if used
        });

        response.data.on('data', (chunk) => {
            const lines = chunk.toString().split('\n');
            for (const line of lines) {
                if (!line.trim()) continue;
                res.write(`data: ${line}\n\n`);
            }
        });

        response.data.on('end', () => {
            res.end();
        });

        response.data.on('error', (err) => {
            console.error('Ollama stream error:', err);
            res.end();
        });

        req.on('close', () => {
            // Keep processing even if client disconnects temporarily (background mode)
            console.log('Client connection closed, but background processing continues.');
        });

    } catch (error) {
        console.error('Error:', error.message);
        res.status(500).json({ error: 'Could not connect to Ollama. Is it running?' });
    }
});

app.get('/api/models', async (req, res) => {
    try {
        const response = await axios.get('http://localhost:11434/api/tags');
        res.json(response.data);
    } catch (error) {
        res.status(500).json({ error: 'Could not fetch models' });
    }
});

app.post('/api/pull-model', async (req, res) => {
    const { model } = req.body;
    try {
        const response = await axios.post('http://localhost:11434/api/pull', {
            name: model,
            stream: true
        }, { responseType: 'stream' });

        res.setHeader('Content-Type', 'text/event-stream');
        response.data.pipe(res);
    } catch (error) {
        console.error('Error pulling model:', error.message);
        res.status(500).json({ error: 'Could not pull model' });
    }
});

server.listen(PORT, () => {
    console.log(`🚀 Ultra-Fast Pro Chat Server running at http://localhost:${PORT}`);
});
