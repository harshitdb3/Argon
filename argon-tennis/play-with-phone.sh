#!/usr/bin/env bash
# Run Argon Tennis on this computer and pair your phone as a gyro racket.
#
# The game runs locally. cloudflared opens a temporary https link to it
# (phones only expose motion sensors on https pages), and the QR code in the
# game is pointed at that link. Ctrl+C stops everything.
#
# Needs: python3 and cloudflared
#   macOS:   brew install cloudflared
#   Windows: winget install --id Cloudflare.cloudflared   (run this script from Git Bash / WSL)
#   Linux:   https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/downloads/
set -euo pipefail
cd "$(dirname "$0")"

PORT="${PORT:-8080}"

if ! command -v cloudflared >/dev/null 2>&1; then
  echo "cloudflared is not installed. On macOS: brew install cloudflared" >&2
  exit 1
fi

LOG_DIR="$(mktemp -d)"
cleanup() {
  kill "${SERVER_PID:-}" "${TUNNEL_PID:-}" 2>/dev/null || true
  rm -rf "$LOG_DIR"
}
trap cleanup EXIT INT TERM

python3 server.py --port "$PORT" >"$LOG_DIR/server.log" 2>&1 &
SERVER_PID=$!

cloudflared tunnel --no-autoupdate --url "http://localhost:$PORT" >"$LOG_DIR/tunnel.log" 2>&1 &
TUNNEL_PID=$!

echo "Starting game server and https tunnel..."
PUBLIC_URL=""
for _ in $(seq 1 60); do
  PUBLIC_URL="$(grep -oE 'https://[a-z0-9-]+\.trycloudflare\.com' "$LOG_DIR/tunnel.log" | head -n1 || true)"
  [ -n "$PUBLIC_URL" ] && break
  if ! kill -0 "$TUNNEL_PID" 2>/dev/null; then
    echo "cloudflared exited:" >&2; cat "$LOG_DIR/tunnel.log" >&2; exit 1
  fi
  sleep 1
done
if [ -z "$PUBLIC_URL" ]; then
  echo "Timed out waiting for the tunnel URL:" >&2; cat "$LOG_DIR/tunnel.log" >&2; exit 1
fi

# Point the in-game QR code at the https link (once the server is up).
for _ in $(seq 1 30); do
  curl -fsS "http://localhost:$PORT/api/tunnel/status" >/dev/null 2>&1 && break
  if ! kill -0 "$SERVER_PID" 2>/dev/null; then
    echo "Game server exited:" >&2; cat "$LOG_DIR/server.log" >&2; exit 1
  fi
  sleep 1
done
curl -fsS -X POST "http://localhost:$PORT/api/tunnel/url" \
  -H 'Content-Type: application/json' \
  -d "{\"tunnelUrl\":\"$PUBLIC_URL\"}" >/dev/null

cat <<EOF

  Game (this computer):  http://localhost:$PORT
  Phone racket link:     $PUBLIC_URL/companion.html?room=default&role=p1

  1. Open the game link, start a match and click "Pocket Racket".
  2. Scan the QR code with your phone (or open the phone link) and tap "Enable Gyro".
     The tunnel can take ~30s to start resolving on the phone.

  Ctrl+C to stop.
EOF

wait "$SERVER_PID"
