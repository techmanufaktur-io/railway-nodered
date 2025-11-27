FROM node:20-alpine

WORKDIR /app

# Install build dependencies for native modules and su-exec for entrypoint
RUN apk add --no-cache python3 make g++ su-exec

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application files
COPY settings.js ./

# Create data directory
RUN mkdir -p /data

# Expose the default Node-RED port
EXPOSE 1880

# Run as non-root user for security
RUN addgroup -S nodered && adduser -S nodered -G nodered
RUN chown -R nodered:nodered /app /data

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Start via entrypoint (runs as root, then drops to nodered user)
ENTRYPOINT ["/entrypoint.sh"]
