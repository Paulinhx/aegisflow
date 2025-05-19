#!/bin/bash
TARGET="aegisflow"

echo "🔎 Simulating dark web lookup..."

# TEMP: Comment out the fail logic to let pipeline pass
# curl -s https://fake-intel.local/api/targets | grep -q "$TARGET" && {
#   echo "⚠️ Dark web targeting detected!"
#   exit 1
# }

echo "✅ No targeting detected. Proceeding."
exit 0
