const express = require('express');
const Redis = require('ioredis');

const redis = new Redis({
    sentinels: [
      { host: process.env.SENTINEL1_PRIVATE_DOMAIN, port: 26379 },
      { host: process.env.SENTINEL2_PRIVATE_DOMAIN, port: 26379 },
      { host: process.env.SENTINEL3_PRIVATE_DOMAIN, port: 26379 },
    ],
    name: "mymaster",
    family: 0,
    sentinelPassword: process.env.REDIS_MASTER_PASSWORD,
    sentinelUsername: "default",
    password: process.env.REDIS_MASTER_PASSWORD,
    username: "default"
  });

const app = express();
const port = process.env.PORT;

app.get('/', async (req, res) => {
    try {
        // Fetch all keys
        const keys = await redis.keys('*');
        let results = {};

        // Fetch values for each key
        for (const key of keys) {
            const value = await redis.get(key);
            results[key] = value;
        }

        // Return all key-value pairs as JSON
        res.json(results);
    } catch (error) {
        console.error('Error accessing Redis', error);
        res.status(500).json({ error: 'Internal server error' });
    }
});

app.get('/set', async (req, res) => {
    // Generate a random key and value
    const key = `key-${Math.random().toString(36).substr(2, 9)}`;
    const value = `value-${Math.random().toString(36).substr(2, 9)}`;

    try {
        // Set the key with a value in Redis
        await redis.set(key, value);
        res.send(`Set ${key} to ${value} in Redis`);
    } catch (error) {
        console.error('Redis set error:', error);
        res.status(500).send('Error setting value in Redis');
    }
});

app.listen(port, '::', () => {
    console.log(`Server is running on port: ${port}`);
});
