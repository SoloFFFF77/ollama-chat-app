const express = require('express');
const axios = require('axios');
const cors = require('cors');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;
const OLLAMA_URL = 'http://localhost:11434/api/generate';

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__current_dir, 'public')));

app.post('/api/chat', async (req, res) => {
    const { model, prompt } = req.body;

    try {
        const response = await axios.post(OLLAMA_URL, {
            model: model || 'mistral',
            prompt: prompt,
            stream: true
        }, { responseType: 'stream' });

        res.setHeader('Content-Type', 'text/plain; charset=utf-8');
        res.setHeader('Transfer-Encoding', 'chunked');

        response.data.on('data', (chunk) => {
            const lines = chunk.toString().split('\n');
            for (const line of lines) {
                if (!line.trim()) continue;
                try {
                    const json = JSON.parse(line);
                    if (json.response) {
                        res.write(json.response);
                    }
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
            res.status(500).send('Error communicating with Ollama');
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

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});
