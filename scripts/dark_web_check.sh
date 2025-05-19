#!/bin/bash
TARGET="aegisflow"

echo "🔎 Simulating dark web lookup..."
curl -s https://fake-intel.local/api/targets | grep -q "$TARGET" && {
  echo "⚠️ Dark web targeting detected!"
  exit 1
}
