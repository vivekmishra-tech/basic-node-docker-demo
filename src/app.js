const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.json({ message: 'Hello from basic-node-docker-demo!' });
});

app.get('/health', (req, res) => res.sendStatus(200));

module.exports = app;
