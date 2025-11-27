# Node-RED on Railway

Deploy Node-RED with S3-compatible storage backend on Railway.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/YOUR_TEMPLATE_ID)

## Features

- Node-RED 4.x with Monaco code editor
- Persistent flow storage using S3-compatible storage (AWS S3 or Railway Object Storage)
- Admin authentication enabled
- HTTP node authentication
- Markdown editor with Mermaid diagrams

## Environment Variables

| Variable                | Required | Description                                                     |
| ----------------------- | -------- | --------------------------------------------------------------- |
| `ADMIN_PASSWORD`        | Yes      | Plain text password for admin user (hashed at startup)          |
| `AWS_S3_BUCKET`         | Yes      | S3 bucket name for storing flows                                |
| `AWS_S3_ENDPOINT`       | Yes      | S3 endpoint URL (e.g., `https://b1.eu-central-1.storage.railway.app` for Railway Object Storage) |
| `AWS_ACCESS_KEY_ID`     | Yes      | S3 access key                                                   |
| `AWS_SECRET_ACCESS_KEY` | Yes      | S3 secret key                                                   |
| `AWS_REGION`            | No       | S3 region (default: eu-west-1)                                  |
| `AWS_S3_APPNAME`        | No       | App name prefix in S3 (default: hostname)                       |
| `USER_PASSWORD`         | No       | Password for HTTP node authentication (user: "user")            |
| `PORT`                  | No       | Port to run on (default: 1880, Railway sets this automatically) |

## Using Railway Object Storage

1. Add Object Storage to your Railway project
2. Copy the credentials from the Object Storage service
3. Set the environment variables in your Node-RED service:
   - `AWS_S3_ENDPOINT` = Endpoint URL from Railway
   - `AWS_S3_BUCKET` = Bucket Name from Railway
   - `AWS_ACCESS_KEY_ID` = Access Key ID from Railway
   - `AWS_SECRET_ACCESS_KEY` = Secret Access Key from Railway
   - `AWS_REGION` = Region from Railway (e.g., `eu-central-1`)

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

## Default Flow

Place a `defaults/flow.json` file to have an initial flow loaded when the S3 bucket is empty.

## License

Apache-2.0
