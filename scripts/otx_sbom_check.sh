#!/bin/bash
API_KEY="YOUR_OTX_API_KEY"
SBOM=$1

jq -r '.artifacts[].hashes.SHA256' $SBOM | while read HASH; do
  echo "Checking $HASH on OTX..."
  res=$(curl -s -H "X-OTX-API-KEY: $API_KEY" \
    "https://otx.alienvault.com/api/v1/indicators/file/$HASH/general")
  echo "$res" | grep -q '"count": 0' || {
    echo "⚠️ IOC Match: $HASH"
    echo "$res" >> reports/otx_hits.json
    exit 1
  }
done
