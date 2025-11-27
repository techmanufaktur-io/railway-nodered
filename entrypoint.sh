#!/bin/sh
set -e

# Fix ownership of /data volume (mounted as root by Railway)
if [ -d /data ]; then
    chown -R nodered:nodered /data
fi

# Create package.json if it doesn't exist
if [ ! -f /data/package.json ]; then
    echo '{"name":"node-red-user-modules","version":"1.0.0"}' > /data/package.json
    chown nodered:nodered /data/package.json
fi

# Switch to nodered user and start Node-RED
exec su-exec nodered npm start
