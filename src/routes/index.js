const express = require('express');
const router = express.Router();

// Define routes
router.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '../../public/index.html'));
});

// Example API route
router.get('/api/example', (req, res) => {
  res.json({ message: 'Hello from the API' });
});

module.exports = router;
