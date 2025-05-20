
#!/bin/bash
set -e

SBOM_FILE=$1
API_KEY="${OTX_API_KEY}"

echo "🔍 Checking SBOM hashes against AlienVault OTX..."
echo "SBOM: $SBOM_FILE"

# Get all SHA256 hashes from the SBOM file
HASHES=$(jq -r '.artifacts[]?.hashes?.SHA256 // empty' "$SBOM_FILE")

MATCH_FOUND=false

mkdir -p reports
> reports/otx_hits.json

for HASH in $HASHES; do
  echo "→ Querying OTX for hash: $HASH"
  RESPONSE=$(curl -s -H "X-OTX-API-KEY: $API_KEY" \
    "https://otx.alienvault.com/api/v1/indicators/file/$HASH/general")

  COUNT=$(echo "$RESPONSE" | jq -r '.pulse_info.count // 0')
  if [ "$COUNT" -gt 0 ]; then
    echo "⚠️ IOC MATCH for $HASH ($COUNT pulses)"
    echo "$RESPONSE" >> reports/otx_hits.json
    MATCH_FOUND=true
  fi
done

if [ "$MATCH_FOUND" = true ]; then
  echo "❌ Threat intelligence match found in OTX. Failing build."
  exit 1
else
  echo "✅ No IOC matches found in OTX."
fi


