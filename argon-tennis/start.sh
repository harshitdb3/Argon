#!/usr/bin/env bash
# Start the Argon Tennis server (Python standard library only).
# Usage: ./start.sh                                -> http://localhost:8080
#        PORT=9000 ./start.sh
#        TUNNEL_URL=https://<public-url> ./start.sh   (phone QR codes point at this URL)
set -euo pipefail
cd "$(dirname "$0")"
exec python3 server.py --port "${PORT:-8080}" ${TUNNEL_URL:+--tunnel-url "$TUNNEL_URL"}
