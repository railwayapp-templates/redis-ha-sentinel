# Use the official Redis image
FROM redis:latest

# Copy your Sentinel configuration file into the container
COPY redis.conf /usr/local/etc/replica.conf

# Set the working directory to where the configuration file is located
WORKDIR /usr/local/etc

# Define the command to start Redis Sentinel with your configuration file
CMD ["redis-server", "/usr/local/etc/replica.conf"]
