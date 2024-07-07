const express = require('express');
const path = require('path');
const app = express();
const routes = require('./routes');

// Middleware to serve static files
app.use(express.static(path.join(__dirname, '../public')));

// Use routes
app.use('/', routes);

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Something broke!');
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

module.exports = app;
