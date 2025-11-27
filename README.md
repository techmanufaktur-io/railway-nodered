# Node-RED on Railway

Deploy Node-RED with AWS S3 storage backend on Railway.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/YOUR_TEMPLATE_ID)

## Features

- Node-RED 4.x with Monaco code editor
- Persistent flow storage using AWS S3
- Admin authentication enabled
- HTTP node authentication
- Markdown editor with Mermaid diagrams

## Environment Variables

| Variable | Required | Description |
|----------|----------|-------------|
| `ADMIN_PASSWORD` | Yes | Bcrypt hashed password for admin user |
| `AWS_S3_BUCKET` | Yes | S3 bucket name for storing flows |
| `AWS_ACCESS_KEY_ID` | Yes | AWS access key |
| `AWS_SECRET_ACCESS_KEY` | Yes | AWS secret key |
| `AWS_REGION` | No | AWS region (default: eu-west-1) |
| `AWS_S3_APPNAME` | No | App name prefix in S3 (default: hostname) |
| `USER_PASSWORD` | No | Password for HTTP node authentication |
| `PORT` | No | Port to run on (default: 1880, Railway sets this automatically) |

## Generating Admin Password

The admin password must be bcrypt hashed. Generate one using:

```bash
node -e "console.log(require('bcryptjs').hashSync('YOUR_PASSWORD', 8))"
```

Or use an online bcrypt generator.

## AWS S3 Setup

1. Create an S3 bucket in your AWS account
2. Create an IAM user with S3 access
3. Add the following policy to the IAM user:

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:ListBucket",
        "s3:CreateBucket"
      ],
      "Resource": [
        "arn:aws:s3:::YOUR_BUCKET_NAME",
        "arn:aws:s3:::YOUR_BUCKET_NAME/*"
      ]
    }
  ]
}
```

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
