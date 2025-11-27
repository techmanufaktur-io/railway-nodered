# Node-RED on Railway

Deploy Node-RED with persistent volume storage on Railway.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/nodered?utm_medium=integration&utm_source=button&utm_campaign=generic)

## Features

- Node-RED 4.x with Monaco code editor
- Persistent flow storage using Railway Volume
- Admin authentication enabled
- HTTP node authentication
- Markdown editor with Mermaid diagrams

## Environment Variables

| Variable         | Required | Description                                                     |
| ---------------- | -------- | --------------------------------------------------------------- |
| `ADMIN_PASSWORD` | Yes      | Plain text password for admin user (hashed at startup)          |
| `USER_PASSWORD`  | No       | Password for HTTP node authentication (user: "user")            |
| `PORT`           | No       | Port to run on (default: 1880, Railway sets this automatically) |

## Storage

This template uses a Railway Volume mounted at `/data` to persist your flows, credentials, and settings. The volume is automatically configured when deploying from the template.

## Local Development

1. Clone this repository
2. Install dependencies: `npm install`
3. Set environment variables (create a `.env` file or export them)
4. Run: `npm start`
5. Open http://localhost:1880

## Deployment

### Railway Template

Click the "Deploy on Railway" button above, or:

1. Fork this repository
2. Go to [Railway](https://railway.app)
3. Create a new project from GitHub repo
4. Add the required environment variables
5. Deploy

### Manual Deployment

```bash
railway login
railway init
railway up
```

## License

Apache-2.0
