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
USER nodered

# Start Node-RED
CMD ["npm", "start"]
