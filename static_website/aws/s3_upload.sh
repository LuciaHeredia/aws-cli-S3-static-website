#!/bin/bash

# === CONFIGURATION ===
BUCKET_NAME="yesce"
REGION="us-east-2"
WEB_DIR="./web" 

echo "🚀 Deploying static website to S3 bucket: $BUCKET_NAME"

# Upload files
aws s3 sync $WEB_DIR s3://$BUCKET_NAME --delete

echo "✅ Upload complete!"
echo "🌐 Website URL: http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
