const express = require('express');
const axios = require('axios');
const cors = require('cors');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;
const OLLAMA_URL = 'http://localhost:11434/api/generate';

app.use(cors());
app.use(express.json({ limit: '50mb' }));
app.use(express.static(path.join(__dirname, 'public')));

// Standard chat endpoint with optimized streaming
app.post('/api/chat', async (req, res) => {
    const { model, prompt, images, context } = req.body;

    try {
        const payload = {
            model: model || 'mistral',
            prompt: prompt,
            stream: true,
            options: {
                num_predict: 1024,
                temperature: 0.7,
                top_p: 0.9,
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
            timeout: 0 // No timeout for long generations
        });

        res.setHeader('Content-Type', 'text/event-stream');
        res.setHeader('Cache-Control', 'no-cache');
        res.setHeader('Connection', 'keep-alive');

        response.data.on('data', (chunk) => {
            const lines = chunk.toString().split('\n');
            for (const line of lines) {
                if (!line.trim()) continue;
                try {
                    const json = JSON.parse(line);
                    // Send raw JSON for the frontend to handle context and status
                    res.write(`data: ${JSON.stringify(json)}\n\n`);
                    if (json.done) {
                        res.end();
                    }
                } catch (e) {
                    // Ignore parse errors for partial chunks
                }
            }
        });

        response.data.on('error', (err) => {
            console.error('Ollama stream error:', err);
            res.status(500).end();
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

app.listen(PORT, () => {
    console.log(`🚀 Pro Chat Server running at http://localhost:${PORT}`);
});
