# Deploy and Host Node-RED on Railway

Node-RED is a flow-based programming tool for wiring together hardware devices, APIs, and online services. It provides a browser-based editor that makes it easy to wire together flows using a wide range of nodes. Built on Node.js, it's lightweight and can run on low-cost hardware or in the cloud.

## Installation / Deployment

1. Click on "Deploy Now"
2. Set the `ADMIN_PASSWORD` variable (default is "password"; username is "admin")
3. Wait a few minutes
4. Click on the railway-nodered service > Settings > Networing > Click "Generate Domain"
5. Wait a few minutes (even if the service is active)
6. Ready!

⚠️ The user interface may take a few minutes to load the first time. After that, it will be as fast as before.

## About Hosting Node-RED

Hosting Node-RED requires persistent storage for flows, credentials, and settings since the editor allows users to modify flows at runtime. This template uses a Railway Volume to persist all Node-RED data, ensuring your flows survive container restarts and redeployments. Authentication is configured out of the box with admin credentials, protecting your Node-RED editor from unauthorized access.

## Common Use Cases

- IoT data processing and device integration pipelines
- API orchestration and webhook automation
- Home automation dashboards and control systems
- Rapid prototyping of backend workflows
- Data transformation and ETL processes

## Dependencies for Node-RED Hosting

- Railway Volume for persistent flow storage
- Node.js 20+ runtime environment

### Deployment Dependencies

- [Node-RED Documentation](https://nodered.org/docs/)
- [Railway Volumes Guide](https://docs.railway.com/reference/volumes)

### Implementation Details

The template uses a Railway Volume mounted at `/data` to persist:

- `flows.json` - Your Node-RED flows
- `flows_cred.json` - Encrypted node credentials
- `.config.*.json` - Editor settings

Environment variables:

```
ADMIN_PASSWORD=your-admin-password
```

## Why Deploy Node-RED on Railway?

Railway is a singular platform to deploy your infrastructure stack. Railway will host your infrastructure so you don't have to deal with configuration, while allowing you to vertically and horizontally scale it.

By deploying Node-RED on Railway, you are one step closer to supporting a complete full-stack application with minimal burden. Host your servers, databases, AI agents, and more on Railway.
