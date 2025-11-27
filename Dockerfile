FROM node:20-alpine

WORKDIR /app

# Install build dependencies for native modules
RUN apk add --no-cache python3 make g++

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application files
COPY settings.js ./
COPY defaults/ ./defaults/

# Create data directory
RUN mkdir -p /data

# Expose the default Node-RED port
EXPOSE 1880

# Run as non-root user for security
RUN addgroup -S nodered && adduser -S nodered -G nodered
RUN chown -R nodered:nodered /app /data

# Initialize package.json in /data for palette manager installs
RUN echo '{"name":"node-red-user-modules","version":"1.0.0"}' > /data/package.json && \
    chown nodered:nodered /data/package.json

USER nodered

# Start Node-RED
CMD ["npm", "start"]
