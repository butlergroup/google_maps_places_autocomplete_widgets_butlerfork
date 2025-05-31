try {
    const https = require('https');
    const fs = require('fs');
    const express = require('express');
    const cors = require('cors');
    const axios = require('axios');
    const path = require('path');
    const helmet = require('helmet');

    const app = express();
    app.set('trust proxy', true);

    // Security headers
    app.use(helmet());

    // middleware config
    app.use(cors());
    app.use(express.urlencoded({ extended: true }));

    // Health check endpoint
    app.get('/api/health', (req, res) => {
        res.status(200).send('OK');
    });

    // Route to lookup suggestions based on user input from Google Places API with masked API key 
    app.get('/api/google-places-suggestion-lookup', async (req, res) => {
        const { input } = req.query;
        const apiUrl = `https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${input}&key=${process.env.GOOGLE_MAPS_API_KEY}`;

        try {
            const response = await axios.get(apiUrl);

            // Send the response back to the client
            res.json(response.data);
        } catch (error) {
            console.error('Error fetching data from Google API:', error);
            res.status(500).json({ error: 'Error fetching data from Google API' });
        }
    });

    // Route to complete address fields based on user click with place ID from Google Places API with masked API key 
    app.get('/api/google-places-autocomplete', async (req, res) => {
        const { place_id, fields, sessiontoken } = req.query;

        if (!place_id) {
            return res.status(400).json({ error: 'place_id is required' });
        }

        try {
            // Construct the Google Places API URL for place details
            const apiUrl = `https://maps.googleapis.com/maps/api/place/details/json?place_id=${place_id}&fields=${fields}&key=${process.env.GOOGLE_MAPS_API_KEY}&sessiontoken=${sessiontoken}`;

            // Fetch the details from the Google Places API
            const response = await axios.get(apiUrl);

            if (response.data.status === 'OK') {
                res.status(200).json(response.data.result);
            } else {
                res.status(400).json({ error: response.data.error_message });
            }
        } catch (error) {
            console.error('Error fetching place details:', error.message);
            res.status(500).json({ error: 'Failed to fetch place details' });
        }
    });

    // Load SSL certificate files
    const sslOptions = {
        key: fs.readFileSync(path.join(__dirname, 'ssl', 'key.pem')),
        cert: fs.readFileSync(path.join(__dirname, 'ssl', 'cert.pem')),
        // ca: fs.readFileSync(path.join(__dirname, 'ssl', 'ca.pem')), // Optional
    };

    // Start HTTPS server
    const server = https.createServer(sslOptions, app);
    server.listen(443, () => {
        console.log('HTTPS Server running on port 443');
    });

} catch (error) {
    console.error('Error starting main application:', error);
}