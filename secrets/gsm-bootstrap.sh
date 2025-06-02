#!/bin/bash
# Set this to your GCP Project ID
PROJECT_ID="your-project-id"
declare -A secrets=(
 ["mq-key-kdb"]="key.kdb"
 ["mq-key-rdb"]="key.rdb"
 ["key.sth"]="key.sth"
 ["ltpa-keys"]="ltpa.keys"
 ["mqwebuser.xml"]="mqwebuser.xml"
 ["mqdevkeystore.jks"]="mqdevkeystore.jks"
 ["mqdevtruststore.jks"]="mqdevtruststore.jks"
 ["DEV_SECRETS"]="credentials.env"
)
for secret in "${!secrets[@]}"; do
 FILE_PATH="secrets/files/${secrets[$secret]}"
 if [[ -f "$FILE_PATH" ]]; then
   echo "Uploading $secret from $FILE_PATH..."
   gcloud secrets create "$secret" --data-file="$FILE_PATH" --project="$PROJECT_ID" --replication-policy="automatic" --quiet || \
   gcloud secrets versions add "$secret" --data-file="$FILE_PATH" --project="$PROJECT_ID"
 else
   echo "⚠️ File not found: $FILE_PATH — skipping $secret"
 fi
done
echo "✅ Secret upload complete."
