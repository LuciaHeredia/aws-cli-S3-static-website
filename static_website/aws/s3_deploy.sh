#!/bin/bash

# === CONFIGURATION ===
BUCKET_NAME=$(terraform -chdir=terraform output -raw bucket_name)
REGION=$(terraform -chdir=terraform output -raw bucket_region)
WEB_DIR="./web" 

# Upload files
echo "--> Deploying static website to S3 bucket: $BUCKET_NAME"
aws s3 sync $WEB_DIR s3://$BUCKET_NAME --delete

# Check files uploaded
echo "--> Checking S3 upload integrity for folder: $WEB_DIR"
INTEGRITY_INDEX=true

while read -r file; do
  # Remove local folder prefix to get the relative path (S3 key)
  S3_KEY="${file#$WEB_DIR/}"

  # Check if the object exists in S3
  aws s3api head-object --bucket "$BUCKET_NAME" --key "$S3_KEY" > /dev/null 2>&1

  if [ $? -eq 0 ]; then
    echo "✅ $S3_KEY exists in S3"
  else
    echo "❌ $S3_KEY is missing in S3"
    INTEGRITY_INDEX=false
  fi
done < <(find "$WEB_DIR" -type f)

if [ "$INTEGRITY_INDEX" = true ]; then
  echo "--> ✅ Upload complete!"
  echo "--> Website URL:  http://$BUCKET_NAME.s3-website.$REGION.amazonaws.com"
else
  echo "--> ❌ Some files were not uploaded."
fi
