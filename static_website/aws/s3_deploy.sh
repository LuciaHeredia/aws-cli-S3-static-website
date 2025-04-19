#!/bin/bash

# === CONFIGURATION ===
BUCKET_NAME=$(terraform -chdir=terraform output -raw bucket_name)
REGION=$(terraform -chdir=terraform output -raw bucket_region)
WEB_DIR="./web" 

echo "--> Deploying static website to S3 bucket: $BUCKET_NAME"

# Upload files
aws s3 sync $WEB_DIR s3://$BUCKET_NAME --delete

# Check files uploaded

echo "--> ✅ Upload complete!"
echo "--> Website URL:  http://$BUCKET_NAME.s3-website-$REGION.amazonaws.com"
